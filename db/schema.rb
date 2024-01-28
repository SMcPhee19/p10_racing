# frozen_string_literal: true

# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 20_240_122_125_850) do
  # These are extensions that must be enabled in order to support this database
  enable_extension 'plpgsql'

  create_table 'seasons', force: :cascade do |t|
    t.string 'season_year'
    t.datetime 'created_at', precision: nil, null: false
    t.datetime 'updated_at', precision: nil, null: false
  end

  create_table 'user_picks', force: :cascade do |t|
    t.bigint 'user_id'
    t.string 'driver_id'
    t.string 'circuit_id'
    t.integer 'points_earned', default: 0
    t.datetime 'created_at', precision: nil, null: false
    t.datetime 'updated_at', precision: nil, null: false
    t.integer 'tenth_finish_position', default: 0
    t.string 'driver_id_dnf'
    t.string 'driver_id_tenth', default: ''
    t.string 'dnf_finish_position'
    t.string 'race_name'
    t.string 'dnf_name'
    t.integer 'season_id'
    t.index ['user_id'], name: 'index_user_picks_on_user_id'
  end

  create_table 'user_seasons', force: :cascade do |t|
    t.bigint 'user_id'
    t.bigint 'season_id'
    t.datetime 'created_at', precision: nil, null: false
    t.datetime 'updated_at', precision: nil, null: false
    t.integer 'total_points', default: 0
    t.index ['season_id'], name: 'index_user_seasons_on_season_id'
    t.index ['user_id'], name: 'index_user_seasons_on_user_id'
  end

  create_table 'userclaims', force: :cascade do |t|
    t.string 'name'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
  end

  create_table 'users', force: :cascade do |t|
    t.string 'name'
    t.datetime 'created_at', precision: nil, null: false
    t.datetime 'updated_at', precision: nil, null: false
    t.string 'pw_hash'
    t.string 'pw_salt'
    t.string 'username'
  end

  create_table 'users_x_userclaims', force: :cascade do |t|
    t.bigint 'user_id'
    t.bigint 'userclaim_id'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['user_id'], name: 'index_users_x_userclaims_on_user_id'
    t.index ['userclaim_id'], name: 'index_users_x_userclaims_on_userclaim_id'
  end

  add_foreign_key 'user_picks', 'users'
  add_foreign_key 'user_seasons', 'seasons'
  add_foreign_key 'user_seasons', 'users'
  add_foreign_key 'users_x_userclaims', 'userclaims'
  add_foreign_key 'users_x_userclaims', 'users'
end
