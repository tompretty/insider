class Rooms::PhaseController < ApplicationController
  before_action :set_room
  before_action :ensure_user_has_joined
  before_action :redirect_to_current_phase

  private

  def set_room
    @room = Room.find(params[:room_id])
  end

  def ensure_user_has_joined
    unless @room.user_has_joined?(current_user)
      redirect_to root_path
    end
  end

  def redirect_to_current_phase
    path = PhaseRouter.call(room: @room, player: @room.player_for(current_user))
    controller = Rails.application.routes.recognize_path(path)[:controller]
    unless controller == params[:controller]
      redirect_to path
    end
  end
end
