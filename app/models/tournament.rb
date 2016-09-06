class Tournament < ApplicationRecord

  has_many :tournament_players
  has_many :rounds
  has_many :players, through: :tournament_players

  def build_tournament
    create_first_round
    create_remaining_rounds
  end

  def process_results(round)
    current_round = rounds.find(round)
    update_next_round(current_round) unless current_round.is_final?
  end

  def champion
    final_winner = rounds.last.matches[0].winner
    final_winner ? final_winner.name : nil
  end

  private

  def create_first_round
    pairings = create_pairings(players)
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

  def update_next_round(round)
    pairings = create_pairings(round.collect_winners)
    next_round = rounds.find(round.id+1)
    next_round.matches.map.with_index do |match, i|
      match.player_one = pairings[i][0]
      match.player_two = pairings[i][1]
      match.save
    end
    next_round.save
  end

  def create_pairings(collection)
    collection.each_slice(2).to_a
  end

  def collect_winners(round)
    currentround = rounds.find(round)
    pairings = create_pairings(current_round.collect_winners)
  end
end
