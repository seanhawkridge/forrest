class AddWinnerToMatch < ActiveRecord::Migration[5.0]
  def change
    add_column :matches, :winner, :integer
  end
end
