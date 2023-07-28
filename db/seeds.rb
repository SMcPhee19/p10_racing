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

UserPick.create!(user_id: user1.id, circuit_id: 'jeddah', driver_id_dnf: 'piastri',
  driver_id_tenth: 'bottas', tenth_finish_position: 18, dnf_finish_position: '')

UserPick.create!(user_id: user1.id, circuit_id: 'albert_park', driver_id_dnf: 'sargeant',
  driver_id_tenth: 'gasly', tenth_finish_position: 13, dnf_finish_position: '')

UserPick.create!(user_id: user1.id, circuit_id: 'baku', driver_id_dnf: 'stroll',
  driver_id_tenth: 'albon', tenth_finish_position: 12, dnf_finish_position: '')

UserPick.create!(user_id: user1.id, circuit_id: 'miami', driver_id_dnf: 'norris',
  driver_id_tenth: 'ocon', tenth_finish_position: 9, dnf_finish_position: '')

UserPick.create!(user_id: user1.id, circuit_id: 'monaco', driver_id_dnf: 'gasly',
  driver_id_tenth: 'tsunoda', tenth_finish_position: 15, dnf_finish_position: '')

UserPick.create!(user_id: user1.id, circuit_id: 'catalunya', driver_id_dnf: 'kevin_magnussen',
  driver_id_tenth: 'tsunoda', tenth_finish_position: 12, dnf_finish_position: '')

UserPick.create!(user_id: user1.id, circuit_id: 'villeneuve', driver_id_dnf: 'hulkenberg',
  driver_id_tenth: 'albon', tenth_finish_position: 7, dnf_finish_position: '')

UserPick.create!(user_id: user1.id, circuit_id: 'red_bull_ring', driver_id_dnf: 'alonso',
  driver_id_tenth: 'albon', tenth_finish_position: 11, dnf_finish_position: '')

UserPick.create!(user_id: user1.id, circuit_id: 'silverstone', driver_id_dnf: 'bottas',
  driver_id_tenth: 'stroll', tenth_finish_position: 14, dnf_finish_position: '')

UserPick.create!(user_id: user1.id, circuit_id: 'hungaroring', driver_id_dnf: 'max_verstappen',
  driver_id_tenth: 'russell', tenth_finish_position: 6, dnf_finish_position: '')

UserPick.all.each do |pick|
  pick.calculate_points
  pick.dnf_points
  user1.calculate_total_points
end