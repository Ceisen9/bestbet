class Game < ActiveRecord::Base
  belongs_to :away_team, class_name: "Team", foreign_key: :away_team_id
  belongs_to :home_team, class_name: "Team", foreign_key: :home_team_id

  def self.all_years
    all_years = self.all.map{|game| game.date.year}.uniq.sort
  end

  def self.find_all_with_year(year)
    if year
      year == "All" ? self.all : self.where(date.year = year)
    else
      []
    end
  end

end
