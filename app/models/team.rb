class Team < ActiveRecord::Base
  has_many :away_games, dependent: :destroy, class_name: "Game", foreign_key: :away_team_id
  has_many :home_games, dependent: :destroy, class_name: "Game", foreign_key: :home_team_id

  def games
    return Game.where("home_team_id = ? OR away_team_id = ?", self.id, self.id)
  end

  def home_wins
    Game.where("home_team_id = ? AND home_team_score > away_team_score", self.id)
  end

  def self.all_divisions
    all_divisions = self.all.map{|team| team.division}.uniq.sort
  end

  def self.find_all_with_division(division)
    if division
      division == "All" ? self.all : self.where(division: division)
    else
      []
    end
  end

end
