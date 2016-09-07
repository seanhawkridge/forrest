class AddWinLossToPlayer < ActiveRecord::Migration[5.0]
  def change
    add_column :players, :wins, :integer, default: 0
    add_column :players, :losses, :integer, default: 0
  end
end
