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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 4) do

  create_table "buildings", :force => true do |t|
    t.string    "name"
    t.integer   "number"
    t.timestamp "created_at"
    t.timestamp "updated_at"
    t.string    "fb_id"
  end

  create_table "emails", :force => true do |t|
    t.string    "from"
    t.text      "message"
    t.string    "signature"
    t.string    "subject"
    t.integer   "roomie_id"
    t.boolean   "processed"
    t.timestamp "created_at"
    t.timestamp "updated_at"
  end

  create_table "roomies", :force => true do |t|
    t.string    "name"
    t.integer   "building_id"
    t.string    "room"
    t.integer   "index"
    t.timestamp "created_at"
    t.timestamp "updated_at"
    t.string    "gender"
    t.string    "fb_id"
    t.string    "email"
  end

end
