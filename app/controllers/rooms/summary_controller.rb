class Rooms::SummaryController < Rooms::PhaseController
  def show
    @player = @room.player_for(current_user)
  end
end
