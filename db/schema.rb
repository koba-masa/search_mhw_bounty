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

ActiveRecord::Schema.define(version: 2020_08_22_114331) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "fields", force: :cascade do |t|
    t.string "name", null: false, comment: "フィールド名"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "monster_types", force: :cascade do |t|
    t.string "type_name", null: false, comment: "種別"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "monsters", force: :cascade do |t|
    t.string "name", null: false, comment: "モンスター名"
    t.bigint "monster_type_id", null: false, comment: "種別"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["monster_type_id"], name: "index_monsters_on_monster_type_id"
  end

  create_table "quest_monsters", force: :cascade do |t|
    t.bigint "quest_id", null: false, comment: "クエストID"
    t.bigint "monster_id", null: false, comment: "モンスターID"
    t.integer "volume", comment: "討伐数"
    t.index ["monster_id"], name: "index_quest_monsters_on_monster_id"
    t.index ["quest_id"], name: "index_quest_monsters_on_quest_id"
  end

  create_table "quest_ranks", force: :cascade do |t|
    t.string "name", null: false, comment: "ランク"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "quests", force: :cascade do |t|
    t.string "quest_type", null: false, comment: "クエスト種別"
    t.bigint "quest_rank_id", null: false, comment: "クエストランク"
    t.string "name", null: false, comment: "クエスト名"
    t.bigint "field_id", null: false, comment: "フィールド"
    t.integer "volume", null: false, comment: "対象種類数"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["field_id"], name: "index_quests_on_field_id"
    t.index ["quest_rank_id"], name: "index_quests_on_quest_rank_id"
  end

  add_foreign_key "monsters", "monster_types"
  add_foreign_key "quest_monsters", "monsters"
  add_foreign_key "quest_monsters", "quests"
  add_foreign_key "quests", "fields"
  add_foreign_key "quests", "quest_ranks"
end
