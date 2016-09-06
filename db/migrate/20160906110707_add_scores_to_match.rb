class AddScoresToMatch < ActiveRecord::Migration[5.0]
  def change
    add_column :matches, :p1_score, :integer
    add_column :matches, :p2_score, :integer
  end
end
