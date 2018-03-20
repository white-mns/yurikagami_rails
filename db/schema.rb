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

ActiveRecord::Schema.define(version: 20180320010411) do

  create_table "items", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "result_no"
    t.integer "generate_no"
    t.integer "e_no"
    t.integer "sub_no"
    t.integer "item_no"
    t.string "name"
    t.integer "kind"
    t.integer "effect"
    t.integer "effect_num"
    t.integer "slash"
    t.integer "charge"
    t.integer "magic"
    t.integer "guard"
    t.integer "protect"
    t.integer "have_rest"
    t.integer "have_max"
    t.integer "prize"
    t.integer "ability"
    t.integer "equip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["ability"], name: "index_items_on_ability"
    t.index ["charge"], name: "index_items_on_charge"
    t.index ["e_no", "result_no", "sub_no", "generate_no"], name: "unique_eno"
    t.index ["effect"], name: "index_items_on_effect"
    t.index ["effect_num"], name: "index_items_on_effect_num"
    t.index ["equip"], name: "index_items_on_equip"
    t.index ["guard"], name: "index_items_on_guard"
    t.index ["have_max"], name: "index_items_on_have_max"
    t.index ["have_rest"], name: "index_items_on_have_rest"
    t.index ["kind"], name: "index_items_on_kind"
    t.index ["magic"], name: "index_items_on_magic"
    t.index ["name"], name: "index_items_on_name"
    t.index ["prize"], name: "index_items_on_prize"
    t.index ["protect"], name: "index_items_on_protect"
    t.index ["slash"], name: "index_items_on_slash"
  end

  create_table "job_names", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "job_id"
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["job_id"], name: "index_job_names_on_job_id"
    t.index ["name"], name: "index_job_names_on_name"
  end

  create_table "names", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "result_no"
    t.integer "generate_no"
    t.integer "e_no"
    t.integer "sub_no"
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["e_no", "result_no", "sub_no", "generate_no"], name: "unique_eno"
    t.index ["name"], name: "index_names_on_name"
  end

  create_table "profiles", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
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
    t.index ["e_no", "result_no", "sub_no", "generate_no"], name: "unique_eno"
    t.index ["nickname"], name: "index_profiles_on_nickname"
  end

  create_table "proper_names", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "proper_id"
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_proper_names_on_name"
    t.index ["proper_id"], name: "index_proper_names_on_proper_id"
  end

  create_table "statuses", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "result_no"
    t.integer "generate_no"
    t.integer "e_no"
    t.integer "sub_no"
    t.integer "lv"
    t.integer "exp"
    t.integer "mexp"
    t.integer "job1"
    t.integer "job2"
    t.integer "hp"
    t.integer "mhp"
    t.float "hp_rate", limit: 24
    t.integer "mp"
    t.integer "mmp"
    t.float "mp_rate", limit: 24
    t.integer "sp"
    t.integer "str"
    t.integer "int"
    t.integer "tec"
    t.integer "agi"
    t.integer "def"
    t.integer "skill"
    t.integer "personality"
    t.integer "tribe"
    t.integer "money"
    t.integer "sundries"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["agi"], name: "index_statuses_on_agi"
    t.index ["def"], name: "index_statuses_on_def"
    t.index ["e_no", "result_no", "sub_no", "generate_no"], name: "unique_eno"
    t.index ["exp"], name: "index_statuses_on_exp"
    t.index ["hp"], name: "index_statuses_on_hp"
    t.index ["hp_rate"], name: "index_statuses_on_hp_rate"
    t.index ["int"], name: "index_statuses_on_int"
    t.index ["job1"], name: "index_statuses_on_job1"
    t.index ["job2"], name: "index_statuses_on_job2"
    t.index ["lv"], name: "index_statuses_on_lv"
    t.index ["mexp"], name: "index_statuses_on_mexp"
    t.index ["mhp"], name: "index_statuses_on_mhp"
    t.index ["mmp"], name: "index_statuses_on_mmp"
    t.index ["money"], name: "index_statuses_on_money"
    t.index ["mp"], name: "index_statuses_on_mp"
    t.index ["mp_rate"], name: "index_statuses_on_mp_rate"
    t.index ["personality"], name: "index_statuses_on_personality"
    t.index ["skill"], name: "index_statuses_on_skill"
    t.index ["sp"], name: "index_statuses_on_sp"
    t.index ["str"], name: "index_statuses_on_str"
    t.index ["sundries"], name: "index_statuses_on_sundries"
    t.index ["tec"], name: "index_statuses_on_tec"
    t.index ["tribe"], name: "index_statuses_on_tribe"
  end

end
