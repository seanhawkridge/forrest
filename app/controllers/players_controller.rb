class PlayersController < ApplicationController

  def new
  end

  def create
    @tournament = Tournament.find(params[:player][:tournament_id])
    @tournament.players.create(player_params)
    redirect_to(:back)
  end

  private

  def player_params
    params.require(:player).permit(:name)
  end

end
