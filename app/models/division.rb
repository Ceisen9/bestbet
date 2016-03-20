class Division < ActiveRecord::Base
  belongs_to :league
  belongs_to :conference
end
