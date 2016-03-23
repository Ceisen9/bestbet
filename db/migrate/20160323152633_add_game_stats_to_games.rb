class AddGameStatsToGames < ActiveRecord::Migration
  def change
      add_column :games, :winner, :integer
      add_column :games, :score_difference, :integer
      add_column :games, :betting_line_winner, :integer
      add_column :games, :over_under_success, :integer
  end
end
