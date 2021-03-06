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

ActiveRecord::Schema.define(version: 20190424183315) do

  create_table "dog_walkers", force: :cascade do |t|
    t.string "name"
    t.string "username"
    t.string "password_digest"
  end

  create_table "dog_walks", force: :cascade do |t|
    t.integer "dog_id"
    t.integer "walk_id"
  end

  create_table "dogs", force: :cascade do |t|
    t.string "name"
    t.string "address"
    t.string "description"
    t.string "owner_name"
  end

  create_table "walks", force: :cascade do |t|
    t.string  "length"
    t.integer "dog_walker_id"
    t.string  "pickup_time"
    t.date    "date"
  end

end
