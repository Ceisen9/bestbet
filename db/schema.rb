# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20160323152633) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "games", force: :cascade do |t|
    t.date    "date"
    t.integer "away_team_id"
    t.integer "home_team_id"
    t.integer "away_team_score"
    t.integer "home_team_score"
    t.float   "betting_line"
    t.float   "over_under"
    t.integer "season"
    t.integer "winner"
    t.integer "score_difference"
    t.integer "betting_line_winner"
    t.integer "over_under_success"
  end

  create_table "teams", force: :cascade do |t|
    t.string "name"
    t.string "division"
    t.string "conference"
  end

end
