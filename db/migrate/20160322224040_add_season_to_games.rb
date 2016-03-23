class AddSeasonToGames < ActiveRecord::Migration
  def change
    add_column :games, :season, :integer
  end
end
