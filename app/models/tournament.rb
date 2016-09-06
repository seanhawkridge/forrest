class Tournament < ApplicationRecord

  has_many :tournament_players
  has_many :rounds
  has_many :players, through: :tournament_players

  def build_tournament
    create_first_round
    create_remaining_rounds
  end

  private

  def create_first_round
    pairings = players.each_slice(2).to_a
    first_round = rounds.build
    first_round_matches = pairings.map do |pair|
      first_round.matches << Match.create(player_one: pair[0], player_two: pair[1])
    end
    first_round.save
    rounds << first_round
  end

  def create_remaining_rounds
    count = players.size / 2
    while count >= 2
      count /= 2
      next_round = rounds.build
      next_round.save
      count.times do
        match = next_round.matches.build
        match.save
        next_round.matches << match
      end
      rounds << next_round
    end
  end
end
