class MatchesController < ApplicationController

  def create
  end

  def update
    @tournament = Tournament.find(params[:match][:tournament_id])
    @match = Match.find(params[:id])
    winner = @match.calculate_winner(params[:match][:p1_score], params[:match][:p2_score])
    @match.update_attributes(winner: winner, p1_score: params[:match][:p1_score], p2_score: params[:match][:p2_score])
    @tournament.process_results(@match.round_id)
    redirect_to(:back)
  end

  private

  def match_params
    params.require(:match).permit(:player_one_id, :player_two_id, :round_id, :p1_score, :p2_score, :winner)
  end
end
