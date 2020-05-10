class Room < ApplicationRecord
  before_create :set_code

  has_many :players, dependent: :destroy
  has_many :users, through: :players

  accepts_nested_attributes_for :players

  enum phase: {
    lobby: 0,
    intro: 1,
    questioning: 2,
    voting: 3,
    summary: 4,
  }

  def start
    update(phase: :intro)
    RoleAllocator.call(room: self)
    # notify users
  end

  def set_word(word)
    update(word: word)
    update(phase: :questioning)
    # notify users
  end

  def vote(user:, votee_id: )
    player = player_for(user)
    player.update(votee_id: votee_id)
    if all_players_have_voted?
      update(phase: :summary)
      create_next_room
      # notify users
    end
  end

  def user_has_joined?(user)
    user_ids.include?(user.id)
  end

  def player_for(user)
    players.find_by(user_id: user.id)
  end

  def num_players
    players.count
  end

  def create_next_room
    next_room = Room.create
    update(next_room_id: next_room.id)
  end

  def next_room
    Room.find(next_room_id)
  end

  private

  def all_players_have_voted?
    players.map(&:has_voted?).all?
  end

  # code
  def set_code
    self.code = generate_code
  end

  def generate_code
    loop do
      code = CodeGenerator.call
      break code unless Room.where(code: code).exists?
    end
  end
end
