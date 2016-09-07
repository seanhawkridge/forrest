class Player < ApplicationRecord

  has_many :tournament_players
  has_many :tournaments, through: :tournament_players

  def update_stats
    update_attributes(games: update_games_count, win_percentage: calculate_win_percentage)
  end

  def update_win_count
    self.wins += 1
  end

  def update_games_count
    self.games += 1
  end

  def calculate_win_percentage
    (wins.to_f/games) * 100
  end
end
