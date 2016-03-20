class Team < ActiveRecord::Base
  belongs_to :league
  belongs_to :conference
  belongs_to :division
end
