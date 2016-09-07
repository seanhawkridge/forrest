class MatchesController < ApplicationController

  def create
  end

  def update
    @match = Match.find(params[:id])
    @match.update_results(params[:match][:p1_score], params[:match][:p2_score])
    @tournament = Tournament.find(params[:match][:tournament_id])
    @tournament.process_results(@match.round_id)
    redirect_to(@tournament)
  end

  private

  def match_params
    params.require(:match).permit(:player_one_id, :player_two_id, :round_id, :p1_score, :p2_score, :winner)
  end
end
