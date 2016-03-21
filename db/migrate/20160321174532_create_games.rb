class CreateGames < ActiveRecord::Migration
  def change
    create_table :games do |t|
      t.date :date
      t.belongs_to :away_team, class_name: "team"
      t.belongs_to :home_team, class_name: "team"
      t.integer :away_team_score
      t.integer :home_team_score
      t.integer :betting_line
      t.integer :over_under
    end
  end
end
