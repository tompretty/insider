class Rooms::ParticipationsController < ApplicationController
  before_action :set_room
  before_action :redirect_if_already_joined, except: :destroy
  before_action :redirect_if_already_started, except: :destroy

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

  def destroy
    if !@room.has_started?
      @player = @room.player_for(current_user)
      @player.destroy
      redirect_to root_path
    else
      redirect_to @room
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
