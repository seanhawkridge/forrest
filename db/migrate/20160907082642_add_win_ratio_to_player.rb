class AddWinRatioToPlayer < ActiveRecord::Migration[5.0]
  def change
    add_column :players, :win_percentage, :integer, default: 0
  end
end
