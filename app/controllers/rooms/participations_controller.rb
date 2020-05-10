class Rooms::ParticipationsController < ApplicationController
  before_action :set_room
  before_action :redirect_if_already_joined
  before_action :redirect_if_already_started

  def new
    @player = @room.players.new
  end

  def create
    build_player
    if @player.save
      redirect_to @room
    else
      render :new
    end
  end

  private

  def build_player
    @player = @room.players.new(room_params)
    @player.user_id = current_user.id
  end

  def room_params
    params.require(:player).permit(:name)
  end

  def set_room
    @room = Room.find(params[:room_id])
  end

  def redirect_if_already_joined
    if @room.user_has_joined?(current_user)
      redirect_to @room
    end
  end

  def redirect_if_already_started
    if @room.has_started?
      redirect_to root_path, alert: "Room already started"
    end
  end
end
