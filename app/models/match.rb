class Match < ApplicationRecord

  belongs_to :player_one, class_name: 'Player', optional: true
  belongs_to :player_two, class_name: 'Player', optional: true
  belongs_to :winner, class_name: 'Player', optional: true
  belongs_to :round

  def update_results(p1_score, p2_score)
    results = calculate_results(p1_score, p2_score)
    results[:winner].update_win_count
    results.each { |position, player| player.update_stats }
    self.update_attributes(winner: results[:winner], p1_score: p1_score, p2_score: p2_score)
  end

  def win_by_bye
    self.update_attributes(winner: player_one)
  end

  def player_type
    bye == true ? "B Y E" : "P L A Y E R"
  end

  private

  def calculate_results(p1_score, p2_score)
    p1_score > p2_score ? {winner: player_one, loser: player_two} : {winner: player_two, loser: player_one}
  end
end
