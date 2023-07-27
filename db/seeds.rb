# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

user1 = User.create!(name: 'Stephen')
user2 = User.create!(name: 'Chase')
user3 = User.create!(name: 'T')
user4 = User.create!(name: 'Steph')
user5 = User.create!(name: 'Eric')
user6 = User.create!(name: 'Camden')

season1 = Season.create!(season_year: '2023')

UserSeason.create!(user_id: user1.id, season_id: season1.id)
UserSeason.create!(user_id: user2.id, season_id: season1.id)
UserSeason.create!(user_id: user3.id, season_id: season1.id)
UserSeason.create!(user_id: user4.id, season_id: season1.id)
UserSeason.create!(user_id: user5.id, season_id: season1.id)
UserSeason.create!(user_id: user6.id, season_id: season1.id)