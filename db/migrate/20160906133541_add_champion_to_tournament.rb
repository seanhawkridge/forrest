class AddChampionToTournament < ActiveRecord::Migration[5.0]
  def change
    add_column :tournaments, :champion, :integer
  end
end
