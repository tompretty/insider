class Player < ApplicationRecord
  validates :name, presence: true, uniqueness: { scope: :room_id }

  belongs_to :user
  belongs_to :room

  enum role: {
    master: 0,
    insider: 1,
    commoner: 2,
  }

  def has_voted?
    votee_id.present?
  end

  def votee
    Player.find(votee_id)
  end
end
