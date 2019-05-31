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

ActiveRecord::Schema.define(version: 2019_05_31_075805) do

  create_table "names", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin", force: :cascade do |t|
    t.integer "result_no"
    t.integer "generate_no"
    t.integer "e_no"
    t.integer "sub_no"
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["result_no", "e_no", "sub_no", "generate_no"], name: "resultno_eno"
  end

  create_table "profiles", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin", force: :cascade do |t|
    t.integer "result_no"
    t.integer "generate_no"
    t.integer "e_no"
    t.integer "sub_no"
    t.string "nickname"
    t.string "title"
    t.string "job"
    t.string "sex"
    t.string "age"
    t.string "height"
    t.string "weight"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["nickname"], name: "index_profiles_on_nickname"
    t.index ["result_no", "e_no", "sub_no", "generate_no"], name: "resultno_eno"
  end

  create_table "proper_names", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin", force: :cascade do |t|
    t.integer "proper_id"
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_proper_names_on_name"
    t.index ["proper_id"], name: "index_proper_names_on_proper_id"
  end

  create_table "statuses", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin", force: :cascade do |t|
    t.integer "result_no"
    t.integer "generate_no"
    t.integer "e_no"
    t.integer "sub_no"
    t.integer "lv"
    t.integer "exp"
    t.integer "mexp"
    t.integer "job1_id"
    t.integer "job2_id"
    t.integer "hp"
    t.integer "mhp"
    t.integer "hp_rate"
    t.integer "mp"
    t.integer "mmp"
    t.integer "mp_rate"
    t.integer "sp"
    t.integer "str"
    t.integer "int"
    t.integer "tec"
    t.integer "agi"
    t.integer "def"
    t.integer "skill"
    t.integer "personality_id"
    t.integer "tribe_id"
    t.integer "money"
    t.integer "sundries"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["agi"], name: "index_statuses_on_agi"
    t.index ["def"], name: "index_statuses_on_def"
    t.index ["exp"], name: "index_statuses_on_exp"
    t.index ["hp"], name: "index_statuses_on_hp"
    t.index ["hp_rate"], name: "index_statuses_on_hp_rate"
    t.index ["int"], name: "index_statuses_on_int"
    t.index ["job1_id"], name: "index_statuses_on_job1_id"
    t.index ["job2_id"], name: "index_statuses_on_job2_id"
    t.index ["lv"], name: "index_statuses_on_lv"
    t.index ["mexp"], name: "index_statuses_on_mexp"
    t.index ["mhp"], name: "index_statuses_on_mhp"
    t.index ["mmp"], name: "index_statuses_on_mmp"
    t.index ["money"], name: "index_statuses_on_money"
    t.index ["mp"], name: "index_statuses_on_mp"
    t.index ["mp_rate"], name: "index_statuses_on_mp_rate"
    t.index ["personality_id"], name: "index_statuses_on_personality_id"
    t.index ["result_no", "e_no", "sub_no", "generate_no"], name: "resultno_eno"
    t.index ["skill"], name: "index_statuses_on_skill"
    t.index ["sp"], name: "index_statuses_on_sp"
    t.index ["str"], name: "index_statuses_on_str"
    t.index ["sundries"], name: "index_statuses_on_sundries"
    t.index ["tec"], name: "index_statuses_on_tec"
    t.index ["tribe_id"], name: "index_statuses_on_tribe_id"
  end

  create_table "uploaded_checks", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin", force: :cascade do |t|
    t.integer "result_no"
    t.integer "generate_no"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["result_no", "generate_no"], name: "resultno_generateno"
  end

end
