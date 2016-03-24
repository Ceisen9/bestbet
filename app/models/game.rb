class Game < ActiveRecord::Base
  belongs_to :away_team, class_name: "Team", foreign_key: :away_team_id
  belongs_to :home_team, class_name: "Team", foreign_key: :home_team_id

  before_save :generate_season
  before_save :generate_winner
  before_save :generate_score_difference
  before_save :generate_betting_line_winner
  before_save :generate_over_under_success

  def generate_season
    if self.date.month < 2
      self.season = self.date.year - 1
    else
      self.season = self.date.year
    end
  end

  def generate_winner
    if self.home_team_score > self.away_team_score
      self.winner = self.home_team_id
    else
      self.winner = self.away_team_id
    end
  end

  def generate_score_difference
    self.score_difference = self.home_team_score - self.away_team_score
  end

  def generate_betting_line_winner
      if (self.home_team_score - self.away_team_score) > self.betting_line
        self.betting_line_winner = self.home_team_id
      else
        self.betting_line_winner = self.away_team_id
      end
  end

  def generate_over_under_success
    if (self.home_team_score + self.away_team_score) > self.over_under
      self.over_under_success = 1
    else
      self.over_under_success = 0
    end
  end

  def games
    return self.where("home_team_id = ? OR away_team_id = ?", self.id, self.id)
  end

  def home_team_wins
     self.winner == self.home_team_id
  end

  def away_team_wins
    self.winner == self.away_team_id
  end

  def self.betting_line_sum(games)
    games.map{|game| game.betting_line}.sum
  end

  def betting_line_success_count_home
    self.winner == self.home_team_id
  end

  def betting_line_success_count_away
    self.winner == self.away_team_id
  end

  def over_under_sum
    self.map{|game| game.over_under}.sum
  end

  def over_under_success_count
    self.over_under_success == 1
  end

  def all_years
    all_years = self.map{|game| game.season}.uniq.sort
  end

end
