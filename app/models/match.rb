class Match < ApplicationRecord

  belongs_to :player_one, class_name: 'Player', optional: true
  belongs_to :player_two, class_name: 'Player', optional: true
  belongs_to :winner, class_name: 'Player', optional: true
  belongs_to :round

  def calculate_winner(p1_score, p2_score)
    p1_score > p2_score ? player_one : player_two
  end

end
