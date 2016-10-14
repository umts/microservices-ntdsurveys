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

ActiveRecord::Schema.define(version: 20161005141210) do

  create_table "survey_trip_stops", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "boarded"
    t.integer  "alighted"
    t.float    "miles_from_previous", limit: 24
    t.integer  "sequence_number"
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
    t.integer  "survey_id"
    t.datetime "time"
    t.string   "location"
  end

  create_table "surveys", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.boolean  "completed",    default: false
    t.boolean  "printed",      default: false
    t.integer  "starting_pax", default: 0
    t.boolean  "in_house",     default: false
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
    t.datetime "date"
    t.string   "shift"
  end
end
