# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

require 'csv'

Game.destroy_all
Team.destroy_all

bears = Team.create(name: "Chicago Bears", division: "NFC North", conference: "NFC")
lions = Team.create(name: "Detroit Lions", division: "NFC North", conference: "NFC")
packers = Team.create(name: "Green Bay Packers", division: "NFC North", conference: "NFC")
vikings = Team.create(name: "Minnesota Vikings", division: "NFC North", conference: "NFC")
falcons = Team.create(name: "Atlanta Falcons", division: "NFC South", conference: "NFC")
panthers = Team.create(name: "Carolina Panthers", division: "NFC South", conference: "NFC")
saints = Team.create(name: "New Orleans Saints", division: "NFC South", conference: "NFC")
buccaneers = Team.create(name: "Tampa Bay Buccaneers", division: "NFC South", conference: "NFC")
cardinals = Team.create(name: "Arizona Cardinals", division: "NFC West", conference: "NFC")
fortyniners = Team.create(name: "San Francisco 49ers", division: "NFC West", conference: "NFC")
seahawks = Team.create(name: "Seattle Seahawks", division: "NFC West", conference: "NFC")
rams = Team.create(name: "St Louis Rams", division: "NFC West", conference: "NFC")
cowboys = Team.create(name: "Dallas Cowboys", division: "NFC East", conference: "NFC")
giants = Team.create(name: "New York Giants", division: "NFC East", conference: "NFC")
eagles = Team.create(name: "Philadelphia Eagles", division: "NFC East", conference: "NFC")
redskins = Team.create(name: "Washington Redskins", division: "NFC East", conference: "NFC")
ravens = Team.create(name: "Baltimore Ravens", division: "AFC North", conference: "AFC")
bengals = Team.create(name: "Cincinnati Bengals", division: "AFC North", conference: "AFC")
browns = Team.create(name: "Cleveland Browns", division: "AFC North", conference: "AFC")
steelers = Team.create(name: "Pittsburgh Steelers", division: "AFC North", conference: "AFC")
texans = Team.create(name: "Houston Texans", division: "AFC South", conference: "AFC")
colts = Team.create(name: "Indianapolis Colts", division: "AFC South", conference: "AFC")
jaguars = Team.create(name: "Jacksonville Jaguars", division: "AFC South", conference: "AFC")
titans = Team.create(name: "Tennessee Titans", division: "AFC South", conference: "AFC")
broncos = Team.create(name: "Denver Broncos", division: "AFC West", conference: "AFC")
chiefs = Team.create(name: "Kansas City Chiefs", division: "AFC West", conference: "AFC")
raiders = Team.create(name: "Oakland Raiders", division: "AFC West", conference: "AFC")
chargers = Team.create(name: "San Diego Chargers", division: "AFC West", conference: "AFC")
bills = Team.create(name: "Buffalo Bills", division: "AFC East", conference: "AFC")
dolphins = Team.create(name: "Miami Dolphins", division: "AFC East", conference: "AFC")
patriots = Team.create(name: "New England Patriots", division: "AFC East", conference: "AFC")
jets = Team.create(name: "New York Jets", division: "AFC East", conference: "AFC")

CSV.foreach('db/nfl_regular_season_data.csv', headers: true) do |row|
  Game.create(
    {
      date: DateTime.strptime(row["date"],"%m/%d/%Y"),
      away_team: Team.find_by(name: row["away_team"]),
      away_team_score: row["away_team_score"],
      home_team: Team.find_by(name: row["home_team"]),
      home_team_score: row["home_team_score"],
      betting_line: row["betting_line"],
      over_under: row["over_under"]
    }
  )
end
