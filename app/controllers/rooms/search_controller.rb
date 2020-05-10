class Rooms::SearchController < ApplicationController
  def create
    room = Room.find_by(code: params[:code])
    if room
      redirect_to new_room_participation_path(room)
    else
      redirect_to root_path
    end
  end
end

