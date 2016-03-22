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

bears = Team.create(name: "Chicago Bears", division: "North", conference: "NFC")
lions = Team.create(name: "Detroit Lions", division: "North", conference: "NFC")
packers = Team.create(name: "Green Bay Packers", division: "North", conference: "NFC")
vikings = Team.create(name: "Minnesota Vikings", division: "North", conference: "NFC")
falcons = Team.create(name: "Atlanta Falcons", division: "South", conference: "NFC")
panthers = Team.create(name: "Carolina Panthers", division: "South", conference: "NFC")
saints = Team.create(name: "New Orleans Saints", division: "South", conference: "NFC")
buccaneers = Team.create(name: "Tampa Bay Buccaneers", division: "South", conference: "NFC")
cardinals = Team.create(name: "Arizona Cardinals", division: "West", conference: "NFC")
fortyniners = Team.create(name: "San Francisco 49ers", division: "West", conference: "NFC")
seahawks = Team.create(name: "Seattle Seahawks", division: "West", conference: "NFC")
rams = Team.create(name: "St Louis Rams", division: "West", conference: "NFC")
cowboys = Team.create(name: "Dallas Cowboys", division: "East", conference: "NFC")
giants = Team.create(name: "New York Giants", division: "East", conference: "NFC")
eagles = Team.create(name: "Philadelphia Eagles", division: "East", conference: "NFC")
redskins = Team.create(name: "Washington Redskins", division: "East", conference: "NFC")
ravens = Team.create(name: "Baltimore Ravens", division: "North", conference: "AFC")
bengals = Team.create(name: "Cincinnati Bengals", division: "North", conference: "AFC")
browns = Team.create(name: "Cleveland Browns", division: "North", conference: "AFC")
steelers = Team.create(name: "Pittsburgh Steelers", division: "North", conference: "AFC")
texans = Team.create(name: "Houston Texans", division: "South", conference: "AFC")
colts = Team.create(name: "Indianapolis Colts", division: "South", conference: "AFC")
jaguars = Team.create(name: "Jacksonville Jaguars", division: "South", conference: "AFC")
titans = Team.create(name: "Tennessee Titans", division: "South", conference: "AFC")
broncos = Team.create(name: "Denver Broncos", division: "West", conference: "AFC")
chiefs = Team.create(name: "Kansas City Chiefs", division: "West", conference: "AFC")
raiders = Team.create(name: "Oakland Raiders", division: "West", conference: "AFC")
chargers = Team.create(name: "San Diego Chargers", division: "West", conference: "AFC")
bills = Team.create(name: "Buffalo Bills", division: "East", conference: "AFC")
dolphins = Team.create(name: "Miami Dolphins", division: "East", conference: "AFC")
patriots = Team.create(name: "New England Patriots", division: "East", conference: "AFC")
jets = Team.create(name: "New York Jets", division: "East", conference: "AFC")

CSV.foreach('db/nfl_regular_season_data_test.csv', headers: true) do |row|
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
