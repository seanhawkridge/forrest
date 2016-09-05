class AddColumnToTournamentPlayer < ActiveRecord::Migration[5.0]
  def change
    add_column :tournament_players, :tournament_id, :integer
    add_column :tournament_players, :player_id, :integer
  end
end
