class Rooms::WordController < ApplicationController
  # todo: ensure current user is the games master
  before_action :set_room

  def create
    @room.set_word(params[:word])
    redirect_to @room
  end

  private

  def set_room
    @room = Room.find(params[:room_id])
  end
end
