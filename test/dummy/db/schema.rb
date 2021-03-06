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

ActiveRecord::Schema.define(version: 20180104204027) do

  create_table "dummy_companions", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "property_a"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "dummy_models", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "property_a"
    t.string "property_b"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "dummy_companion_id"
    t.index ["dummy_companion_id"], name: "index_dummy_models_on_dummy_companion_id"
  end

  create_table "time_line_records", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "target_type"
    t.bigint "target_id"
    t.string "executor_type"
    t.bigint "executor_id"
    t.string "event_type"
    t.json "old_values"
    t.json "new_values"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["executor_type", "executor_id"], name: "index_time_line_records_on_executor_type_and_executor_id"
    t.index ["target_type", "target_id"], name: "index_time_line_records_on_target_type_and_target_id"
  end

end
