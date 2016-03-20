class Game < ActiveRecord::Base
  belongs_to :league
  belongs_to :conference
  belongs_to :division
  belongs_to :team
end
