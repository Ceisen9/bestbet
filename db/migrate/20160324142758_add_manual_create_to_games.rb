class AddManualCreateToGames < ActiveRecord::Migration
  def change
    add_column :games, :manual_creation, :bool
  end
end
