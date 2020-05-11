class Rooms::StartController < ApplicationController
  #todo: must be in game, must have enough players
  before_action :set_room

  def create
    @room.start
    RoomChannel.broadcast_to @room, {}
    redirect_to @room
  end

  private

  def set_room
    @room = Room.find(params[:room_id])
  end
end
