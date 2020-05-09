class Rooms::VoteController < ApplicationController
  before_action :set_room

  def create
    @room.vote(user: current_user, votee_id: params[:player_id])
    redirect_to @room
  end

  private

  def set_room
    @room = Room.find(params[:room_id])
  end
end
