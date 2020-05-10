class Rooms::SearchController < ApplicationController
  def create
    room = Room.find_by(code: params[:code])
    if room
      if room.user_has_joined?(current_user)
        redirect_to room
      elsif room.has_started?
        redirect_to root_path, alert: "Room has already started"
      else
        redirect_to new_room_participation_path(room)
      end
    else
      redirect_to root_path, alert: "No room found"
    end
  end
end

