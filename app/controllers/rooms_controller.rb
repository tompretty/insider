class RoomsController < ApplicationController
  before_action :set_room, only: :show
  before_action :ensure_user_has_joined, only: :show

  def show
  end

  def new
    @room = Room.new
    @room.players.new
  end

  def create
    build_room
    @room.save
    redirect_to @room
  end

  private

  def build_room
    @room = Room.new(room_params)
    @room.players.first.user_id = current_user_id
  end

  def room_params
    params.require(:room).permit(players_attributes: [:name])
  end

  def set_room
    @room = Room.find(params[:id])
  end

  def ensure_user_has_joined
    unless @room.user_has_joined?(current_user)
      redirect_to root_path
    end
  end
end
