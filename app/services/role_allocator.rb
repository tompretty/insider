class RoleAllocator
  def initialize(room:)
    @room = room
  end

  def self.call(room:)
    RoleAllocator.new(room: room).call
  end

  def call
    roles = (0...@room.num_players).map { |_| :commoner }
    roles[0] = :master
    roles[1] = :insider
    roles = roles.shuffle

    @room.players.zip(roles).each do |player, role|
      player.update(role: role)
    end
  end
end
