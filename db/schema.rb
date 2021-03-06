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

ActiveRecord::Schema.define(version: 20160907153323) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "byes", force: :cascade do |t|
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.integer  "tournament_id"
    t.index ["tournament_id"], name: "index_byes_on_tournament_id", using: :btree
  end

  create_table "matches", force: :cascade do |t|
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
    t.integer  "player_one_id"
    t.integer  "player_two_id"
    t.integer  "round_id"
    t.integer  "winner_id"
    t.integer  "p1_score"
    t.integer  "p2_score"
    t.boolean  "bye",           default: false
    t.index ["round_id"], name: "index_matches_on_round_id", using: :btree
  end

  create_table "players", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.integer  "wins",           default: 0
    t.integer  "losses"
    t.integer  "games",          default: 0
    t.integer  "win_percentage", default: 0
  end

  create_table "rounds", force: :cascade do |t|
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.integer  "tournament_id"
    t.index ["tournament_id"], name: "index_rounds_on_tournament_id", using: :btree
  end

  create_table "tournament_players", force: :cascade do |t|
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.integer  "tournament_id"
    t.integer  "player_id"
  end

  create_table "tournaments", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "champion"
  end

  add_foreign_key "byes", "tournaments"
  add_foreign_key "matches", "rounds"
  add_foreign_key "rounds", "tournaments"
end
