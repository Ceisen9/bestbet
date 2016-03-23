class Team < ActiveRecord::Base
  has_many :away_games, dependent: :destroy, class_name: "Game", foreign_key: :away_team_id
  has_many :home_games, dependent: :destroy, class_name: "Game", foreign_key: :home_team_id

  # accepts_nested_attributes_for :home_games, :away_games

  def games
    return Game.where("home_team_id = ? OR away_team_id = ?", self.id, self.id)
  end

  def games_played(games)
    games.count
  end

  def wins(games, team)
    games.where(winner: team.id).count
  end

  def home_wins
    Game.where("home_team_id = ? AND home_team_score > away_team_score", self.id)
  end

  def betting_line_sum(games)
    games.map{|game| game.betting_line}.sum
  end

  def self.all_divisions
    all_divisions = self.all.map{|team| team.division}.uniq.sort
  end

  def self.all_conferences
    all_conferences = self.all.map{|team| team.conference}.uniq.sort
  end

  def self.find_all_with_division(division)
    if division
      division == "All" ? self.all : self.where(division: division)
    else
      []
    end
  end

  def self.find_all_with_conference(conference)
    if conference
      conference == "All" ? self.all : self.where(conference: conference)
    else
      []
    end
  end

  def self.all_years(team)
    all_years = team.games.map{|game| game.season}.uniq.sort
  end

end
