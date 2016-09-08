class Round < ApplicationRecord

  has_many :matches
  belongs_to :tournament

  def is_final?
    self.matches.length < 2
  end

  def collect_winners
    matches.map { |match| match.winner }
  end

  def update_byes
    matches.each do |match|
      if match.bye == true
        match.win_by_bye
      end
    end
  end
end
