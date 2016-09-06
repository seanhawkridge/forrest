require 'rails_helper'

RSpec.describe Tournament, type: :model do

  describe Tournament, '#build_tournament' do

    before do
      @player_one = FactoryGirl.create(:player, name: :"Sean")
      @player_two = FactoryGirl.create(:player, name: :"Eleanor")
      @player_three = FactoryGirl.create(:player, name: :"Zac")
      @player_four = FactoryGirl.create(:player, name: :"Jude")
      @tournament = FactoryGirl.create(:tournament, name: "Forrest")
      @tournament.players << [@player_one, @player_two, @player_three, @player_four]
      @tournament.build_tournament
    end

    it 'generates a round of matches based on the player list' do
      expect(@tournament.rounds[0].matches[0].player_one).to eq @player_one
      expect(@tournament.rounds[0].matches[0].player_two).to eq @player_two
      expect(@tournament.rounds[0].matches[1].player_one).to eq @player_three
      expect(@tournament.rounds[0].matches[1].player_two).to eq @player_four
    end

    it 'generates the next round with empty matches' do
      expect(@tournament.rounds[1].matches.first.player_one).to eq nil
      expect(@tournament.rounds[1].matches.first.player_two).to eq nil
    end
  end
end
