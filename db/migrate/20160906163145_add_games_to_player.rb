class AddGamesToPlayer < ActiveRecord::Migration[5.0]
  def change
    add_column :players, :games, :integer, default: 0
  end
end
