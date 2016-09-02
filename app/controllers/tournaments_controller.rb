class TournamentsController < ApplicationController

  def index
    @tournaments = Tournament.all
  end

  def new
    @tournament = Tournament.new
  end

  def create
    @tournament = Tournament.new(tournament_params)
    @tournament.save
    redirect_to @tournament
  end

  def show
    @tournament = Tournament.find(params[:id])
  end

  private

  def tournament_params
    params.require(:tournament).permit(:name)
  end
end
