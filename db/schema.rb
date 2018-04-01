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

ActiveRecord::Schema.define(version: 20180401005905) do

  create_table "event_proceeds", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "result_no"
    t.integer "generate_no"
    t.integer "e_no"
    t.integer "sub_no"
    t.integer "event"
    t.integer "last_flag"
    t.integer "flag"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["e_no", "result_no", "sub_no", "generate_no"], name: "unique_eno"
    t.index ["event"], name: "index_event_proceeds_on_event"
    t.index ["flag"], name: "index_event_proceeds_on_flag"
    t.index ["last_flag"], name: "index_event_proceeds_on_last_flag"
  end

  create_table "events", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "result_no"
    t.integer "generate_no"
    t.integer "e_no"
    t.integer "sub_no"
    t.integer "event"
    t.integer "flag"
    t.integer "text"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["e_no", "result_no", "sub_no", "generate_no"], name: "unique_eno"
    t.index ["event"], name: "index_events_on_event"
    t.index ["flag"], name: "index_events_on_flag"
    t.index ["text"], name: "index_events_on_text"
  end

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

  create_table "learnable_skills", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "chara_type"
    t.integer "job_id"
    t.integer "sp"
    t.integer "skill_no"
    t.integer "skill_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["chara_type"], name: "index_learnable_skills_on_chara_type"
    t.index ["job_id"], name: "index_learnable_skills_on_job_id"
    t.index ["skill_id"], name: "index_learnable_skills_on_skill_id"
    t.index ["skill_no"], name: "index_learnable_skills_on_skill_no"
    t.index ["sp"], name: "index_learnable_skills_on_sp"
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

  create_table "new_events", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "result_no"
    t.integer "generate_no"
    t.integer "event"
    t.integer "flag"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["event"], name: "index_new_events_on_event"
    t.index ["flag"], name: "index_new_events_on_flag"
    t.index ["result_no", "generate_no"], name: "unique_eno"
  end

  create_table "parties", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "result_no"
    t.integer "generate_no"
    t.integer "party_no"
    t.integer "e_no"
    t.integer "sub_no"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["e_no", "result_no", "sub_no", "generate_no"], name: "unique_eno"
    t.index ["party_no"], name: "index_parties_on_party_no"
  end

  create_table "party_infos", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "result_no"
    t.integer "generate_no"
    t.integer "party_no"
    t.string "name"
    t.integer "member_num"
    t.integer "battler_num"
    t.integer "sook_num"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["battler_num"], name: "index_party_infos_on_battler_num"
    t.index ["member_num"], name: "index_party_infos_on_member_num"
    t.index ["name"], name: "index_party_infos_on_name"
    t.index ["party_no", "result_no", "generate_no"], name: "unique_pno"
    t.index ["sook_num"], name: "index_party_infos_on_sook_num"
  end

  create_table "place_names", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "place_id"
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_place_names_on_name"
    t.index ["place_id"], name: "index_place_names_on_place_id"
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

  create_table "skill_data", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "skill_id"
    t.string "name"
    t.integer "at"
    t.integer "ct"
    t.integer "timing"
    t.integer "mp"
    t.integer "target"
    t.integer "range"
    t.integer "property"
    t.integer "element"
    t.string "text"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["at"], name: "index_skill_data_on_at"
    t.index ["ct"], name: "index_skill_data_on_ct"
    t.index ["element"], name: "index_skill_data_on_element"
    t.index ["mp"], name: "index_skill_data_on_mp"
    t.index ["name"], name: "index_skill_data_on_name"
    t.index ["property"], name: "index_skill_data_on_property"
    t.index ["range"], name: "index_skill_data_on_range"
    t.index ["skill_id"], name: "index_skill_data_on_skill_id"
    t.index ["target"], name: "index_skill_data_on_target"
    t.index ["timing"], name: "index_skill_data_on_timing"
  end

  create_table "skills", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "result_no"
    t.integer "generate_no"
    t.integer "e_no"
    t.integer "sub_no"
    t.integer "skill_no"
    t.integer "skill_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["e_no", "result_no", "sub_no", "generate_no"], name: "unique_eno"
    t.index ["skill_id"], name: "index_skills_on_skill_id"
    t.index ["skill_no"], name: "index_skills_on_skill_no"
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
