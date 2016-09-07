class ChangePlayerWinLossDefault < ActiveRecord::Migration[5.0]
  def change
    change_column_default(:players, :wins, 0)
  end
end
