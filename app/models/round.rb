class Round < ApplicationRecord

  has_many :matches
  belongs_to :tournament

  def is_final?
    self.matches.length < 2
  end

  def collect_winners
    matches.map { |match| match.winner }
  end
end
