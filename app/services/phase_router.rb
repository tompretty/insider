class PhaseRouter
  include Rails.application.routes.url_helpers

  def initialize(room:, player:)
    @room = room
    @player = player
  end

  def self.call(room:, player:)
    PhaseRouter.new(room: room, player: player).call
  end

  def call
    case room.phase
    when "lobby"
      room_lobby_path(room)
    when "intro" 
      if player.role == "master"
        room_master_intro_path(room)
      elsif player.role == "insider"
        room_insider_intro_path(room)
      elsif player.role == "commoner"
        room_commoner_intro_path(room)
      end
    when "questioning"
      if player.role == "master"
        room_master_questioning_path(room)
      elsif player.role == "insider"
        room_insider_questioning_path(room)
      elsif player.role == "commoner"
        room_commoner_questioning_path(room)
      end
    when "voting"
      if player.has_voted?
        room_voting_waiting_path(room)
      else
        room_voting_path(room)
      end
    when "summary"
      room_summary_path(room)
    end
  end

  private

  attr_reader :player, :room
end
