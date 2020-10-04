# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_10_04_023814) do

  create_table "consultations", id: :integer, unsigned: true, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", force: :cascade do |t|
    t.integer "schedule_id", default: 0, null: false
    t.integer "user_id", default: 0, null: false
    t.date "date", null: false
    t.boolean "deleted", default: false, null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["schedule_id"], name: "index_consultations_on_schedule_id"
    t.index ["user_id"], name: "index_consultations_on_user_id"
  end

  create_table "hcfs", id: :integer, unsigned: true, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", force: :cascade do |t|
    t.string "name", limit: 50, default: "", null: false
    t.string "image_path"
    t.text "description"
    t.integer "hcf_type", limit: 1, unsigned: true
    t.string "province", limit: 50, default: "", null: false
    t.string "city", limit: 50, default: "", null: false
    t.string "district", limit: 50, default: "", null: false
    t.string "address", default: "", null: false
    t.decimal "latitude", precision: 10, scale: 8
    t.decimal "longitude", precision: 11, scale: 8
    t.boolean "deleted", default: false, null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["city"], name: "index_hcfs_on_city"
    t.index ["district"], name: "index_hcfs_on_district"
    t.index ["hcf_type"], name: "index_hcfs_on_hcf_type"
    t.index ["name"], name: "index_hcfs_on_name"
    t.index ["province"], name: "index_hcfs_on_province"
  end

  create_table "hcfs_hcps", id: false, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", force: :cascade do |t|
    t.integer "hcf_id", null: false
    t.integer "hcp_id", null: false
    t.index ["hcf_id", "hcp_id"], name: "index_hcfs_hcps_on_hcf_id_and_hcp_id"
  end

  create_table "hcfs_medical_facilities", id: false, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", force: :cascade do |t|
    t.integer "hcf_id", null: false
    t.integer "medical_facility_id", null: false
    t.index ["hcf_id", "medical_facility_id"], name: "index_hcfs_medical_facilities_on_hcf_id_and_medical_facility_id"
  end

  create_table "hcps", id: :integer, unsigned: true, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", force: :cascade do |t|
    t.string "name", limit: 50, default: "", null: false
    t.string "image_path"
    t.text "description"
    t.integer "speciality_id", unsigned: true
    t.boolean "deleted", default: false, null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["name"], name: "index_hcps_on_name"
    t.index ["speciality_id"], name: "index_hcps_on_speciality_id"
  end

  create_table "medical_facilities", id: :integer, unsigned: true, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", force: :cascade do |t|
    t.string "name", limit: 50, default: "", null: false
  end

  create_table "schedules", id: :integer, unsigned: true, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", force: :cascade do |t|
    t.integer "hcf_id", default: 0, null: false
    t.integer "hcp_id", default: 0, null: false
    t.string "day", limit: 3, null: false
    t.time "time_start", null: false
    t.time "time_end", null: false
    t.boolean "deleted", default: false, null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["day", "hcf_id", "hcp_id"], name: "index_schedules_on_day_and_hcf_id_and_hcp_id"
    t.index ["day"], name: "index_schedules_on_day"
    t.index ["hcf_id"], name: "index_schedules_on_hcf_id"
    t.index ["hcp_id"], name: "index_schedules_on_hcp_id"
    t.index ["time_end"], name: "index_schedules_on_time_end"
    t.index ["time_start"], name: "index_schedules_on_time_start"
  end

  create_table "sessions", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", force: :cascade do |t|
    t.string "session_id", null: false
    t.text "data"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["session_id"], name: "index_sessions_on_session_id", unique: true
    t.index ["updated_at"], name: "index_sessions_on_updated_at"
  end

  create_table "specialities", id: :integer, unsigned: true, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", force: :cascade do |t|
    t.string "name", limit: 50, default: "", null: false
  end

  create_table "users", id: :integer, unsigned: true, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "name", default: "", null: false
    t.string "image_url"
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "provider", limit: 50, default: "", null: false
    t.string "uid", limit: 500, default: "", null: false
    t.boolean "deleted", default: false, null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.text "tokens"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
