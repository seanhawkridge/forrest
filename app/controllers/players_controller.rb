class PlayersController < ApplicationController

  def index
    @players = Player.all
  end

  def new
  end

  def create
    @tournament = Tournament.find(params[:player][:tournament_id])
    @tournament.players.create(player_params)
    redirect_to(:back)
  end

  private

  def player_params
    params.require(:player).permit(:name, :wins, :games, :win_percentage)
  end

end
