class Game < ActiveRecord::Base
  belongs_to :away_team, class_name: "Team", foreign_key: :away_team_id
  belongs_to :home_team, class_name: "Team", foreign_key: :home_team_id

  before_save :generate_season

  def generate_season
    if self.date.month < 2
      self.season = self.date.year - 1
    else
      self.season = self.date.year
    end
  end

end
