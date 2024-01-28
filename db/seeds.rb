# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

UserSeason.destroy_all
UserPick.destroy_all
Season.destroy_all
User.destroy_all

user1 = User.create!(name: 'Stephen', username: 'poweredbygohan', pw_salt: '96b0a57c-d9ae-453f-b56f-3b154eb10cda',
                     pw_hash: 'ffd9fb2f50dcfc9be0456874c7358b13')
user2 = User.create!(name: 'Chase', username: 'test1')
user3 = User.create!(name: 'T', username: 'test2')
user4 = User.create!(name: 'Steph', username: 'test3')
user5 = User.create!(name: 'Eric', username: 'test4')
user6 = User.create!(name: 'Camden', username: 'test5')
user7 = User.create!(name: 'Jim', username: 'test6')

season1 = Season.create!(season_year: '2023')
season2 = Season.create!(season_year: '2024')

# 2023 season
user_season1 = UserSeason.create!(user_id: user1.id, season_id: season1.id)
user_season2 = UserSeason.create!(user_id: user2.id, season_id: season1.id)
user_season3 = UserSeason.create!(user_id: user3.id, season_id: season1.id)
user_season4 = UserSeason.create!(user_id: user4.id, season_id: season1.id)
user_season5 = UserSeason.create!(user_id: user5.id, season_id: season1.id)
user_season6 = UserSeason.create!(user_id: user6.id, season_id: season1.id)
user_season7 = UserSeason.create!(user_id: user7.id, season_id: season1.id)

# 2024 season
user_season8 = UserSeason.create!(user_id: user1.id, season_id: season2.id)
user_season9 = UserSeason.create!(user_id: user2.id, season_id: season2.id)
user_season10 = UserSeason.create!(user_id: user3.id, season_id: season2.id)
user_season11 = UserSeason.create!(user_id: user4.id, season_id: season2.id)
user_season12 = UserSeason.create!(user_id: user5.id, season_id: season2.id)
user_season13 = UserSeason.create!(user_id: user6.id, season_id: season2.id)
user_season14 = UserSeason.create!(user_id: user7.id, season_id: season2.id)

# My Picks
UserPick.create!(user_id: user1.id, circuit_id: 'jeddah', driver_id_dnf: 'piastri',
                 driver_id_tenth: 'bottas', tenth_finish_position: 18, dnf_finish_position: '', season_id: 1)

UserPick.create!(user_id: user1.id, circuit_id: 'albert_park', driver_id_dnf: 'sargeant',
                 driver_id_tenth: 'gasly', tenth_finish_position: 13, dnf_finish_position: '', season_id: 1)

UserPick.create!(user_id: user1.id, circuit_id: 'baku', driver_id_dnf: 'stroll',
                 driver_id_tenth: 'albon', tenth_finish_position: 12, dnf_finish_position: '', season_id: 1)

UserPick.create!(user_id: user1.id, circuit_id: 'miami', driver_id_dnf: 'norris',
                 driver_id_tenth: 'ocon', tenth_finish_position: 9, dnf_finish_position: '', season_id: 1)

UserPick.create!(user_id: user1.id, circuit_id: 'monaco', driver_id_dnf: 'gasly',
                 driver_id_tenth: 'tsunoda', tenth_finish_position: 15, dnf_finish_position: '', season_id: 1)

UserPick.create!(user_id: user1.id, circuit_id: 'catalunya', driver_id_dnf: 'kevin_magnussen',
                 driver_id_tenth: 'tsunoda', tenth_finish_position: 12, dnf_finish_position: '', season_id: 1)

UserPick.create!(user_id: user1.id, circuit_id: 'villeneuve', driver_id_dnf: 'hulkenberg',
                 driver_id_tenth: 'albon', tenth_finish_position: 7, dnf_finish_position: '', season_id: 1)

UserPick.create!(user_id: user1.id, circuit_id: 'red_bull_ring', driver_id_dnf: 'alonso',
                 driver_id_tenth: 'albon', tenth_finish_position: 11, dnf_finish_position: '', season_id: 1)

UserPick.create!(user_id: user1.id, circuit_id: 'silverstone', driver_id_dnf: 'bottas',
                 driver_id_tenth: 'stroll', tenth_finish_position: 14, dnf_finish_position: '', season_id: 1)

UserPick.create!(user_id: user1.id, circuit_id: 'hungaroring', driver_id_dnf: 'max_verstappen',
                 driver_id_tenth: 'russell', tenth_finish_position: 6, dnf_finish_position: '', season_id: 1)

# Chase's Picks
UserPick.create!(user_id: user2.id, circuit_id: 'jeddah', driver_id_dnf: 'max_verstappen',
                 driver_id_tenth: 'kevin_magnussen', tenth_finish_position: 10, dnf_finish_position: '', season_id: 1)

UserPick.create!(user_id: user2.id, circuit_id: 'albert_park', driver_id_dnf: 'piastri',
                 driver_id_tenth: 'norris', tenth_finish_position: 6, dnf_finish_position: '', season_id: 1)

UserPick.create!(user_id: user2.id, circuit_id: 'baku', driver_id_dnf: 'piastri',
                 driver_id_tenth: 'ocon', tenth_finish_position: 12, dnf_finish_position: '', season_id: 1)

UserPick.create!(user_id: user2.id, circuit_id: 'miami', driver_id_dnf: 'zhou',
                 driver_id_tenth: 'ocon', tenth_finish_position: 9, dnf_finish_position: '', season_id: 1)

UserPick.create!(user_id: user2.id, circuit_id: 'monaco', driver_id_dnf: 'stroll',
                 driver_id_tenth: 'norris', tenth_finish_position: 15, dnf_finish_position: 'R', season_id: 1)

UserPick.create!(user_id: user2.id, circuit_id: 'catalunya', driver_id_dnf: 'sainz',
                 driver_id_tenth: 'hulkenberg', tenth_finish_position: 15, dnf_finish_position: '', season_id: 1)

UserPick.create!(user_id: user2.id, circuit_id: 'villeneuve', driver_id_dnf: 'perez',
                 driver_id_tenth: 'hulkenberg', tenth_finish_position: 15, dnf_finish_position: '', season_id: 1)

UserPick.create!(user_id: user2.id, circuit_id: 'red_bull_ring', driver_id_dnf: 'sargeant',
                 driver_id_tenth: 'stroll', tenth_finish_position: 9, dnf_finish_position: '', season_id: 1)

UserPick.create!(user_id: user2.id, circuit_id: 'silverstone', driver_id_dnf: 'piastri',
                 driver_id_tenth: 'albon', tenth_finish_position: 8, dnf_finish_position: '', season_id: 1)

UserPick.create!(user_id: user2.id, circuit_id: 'hungaroring', driver_id_dnf: 'ricciardo',
                 driver_id_tenth: 'bottas', tenth_finish_position: 12, dnf_finish_position: '', season_id: 1)

# T's Picks
UserPick.create!(user_id: user3.id, circuit_id: 'jeddah', driver_id_dnf: 'max_verstappen',
                 driver_id_tenth: 'zhou', tenth_finish_position: 13, dnf_finish_position: '', season_id: 1)

UserPick.create!(user_id: user3.id, circuit_id: 'albert_park', driver_id_dnf: 'norris',
                 driver_id_tenth: 'zhou', tenth_finish_position: 9, dnf_finish_position: '', season_id: 1)

UserPick.create!(user_id: user3.id, circuit_id: 'baku', driver_id_dnf: 'hulkenberg',
                 driver_id_tenth: 'tsunoda', tenth_finish_position: 10, dnf_finish_position: '', season_id: 1)

UserPick.create!(user_id: user3.id, circuit_id: 'miami', driver_id_dnf: 'leclerc',
                 driver_id_tenth: 'hamilton', tenth_finish_position: 6, dnf_finish_position: '', season_id: 1)

UserPick.create!(user_id: user3.id, circuit_id: 'monaco', driver_id_dnf: 'albon',
                 driver_id_tenth: 'russell', tenth_finish_position: 5, dnf_finish_position: '', season_id: 1)

UserPick.create!(user_id: user3.id, circuit_id: 'catalunya', driver_id_dnf: 'norris',
                 driver_id_tenth: 'hulkenberg', tenth_finish_position: 15, dnf_finish_position: '', season_id: 1)

UserPick.create!(user_id: user3.id, circuit_id: 'villeneuve', driver_id_dnf: 'kevin_magnussen',
                 driver_id_tenth: 'gasly', tenth_finish_position: 12, dnf_finish_position: '', season_id: 1)

UserPick.create!(user_id: user3.id, circuit_id: 'red_bull_ring', driver_id_dnf: 'bottas',
                 driver_id_tenth: 'ocon', tenth_finish_position: 14, dnf_finish_position: '', season_id: 1)

UserPick.create!(user_id: user3.id, circuit_id: 'silverstone', driver_id_dnf: 'stroll',
                 driver_id_tenth: 'ocon', tenth_finish_position: 20, dnf_finish_position: '', season_id: 1)

UserPick.create!(user_id: user3.id, circuit_id: 'hungaroring', driver_id_dnf: 'piastri',
                 driver_id_tenth: 'ricciardo', tenth_finish_position: 13, dnf_finish_position: '', season_id: 1)

# Steph's Picks
UserPick.create!(user_id: user4.id, circuit_id: 'jeddah', driver_id_dnf: 'sainz',
                 driver_id_tenth: 'gasly', tenth_finish_position: 9, dnf_finish_position: '', season_id: 1)

UserPick.create!(user_id: user4.id, circuit_id: 'albert_park', driver_id_dnf: 'norris',
                 driver_id_tenth: 'tsunoda', tenth_finish_position: 10, dnf_finish_position: '', season_id: 1)

UserPick.create!(user_id: user4.id, circuit_id: 'baku', driver_id_dnf: 'kevin_magnussen',
                 driver_id_tenth: 'norris', tenth_finish_position: 9, dnf_finish_position: '', season_id: 1)

UserPick.create!(user_id: user4.id, circuit_id: 'miami', driver_id_dnf: 'leclerc',
                 driver_id_tenth: 'albon', tenth_finish_position: 14, dnf_finish_position: '', season_id: 1)

UserPick.create!(user_id: user4.id, circuit_id: 'monaco', driver_id_dnf: 'sargeant',
                 driver_id_tenth: 'piastri', tenth_finish_position: 10, dnf_finish_position: '', season_id: 1)

UserPick.create!(user_id: user4.id, circuit_id: 'catalunya', driver_id_dnf: 'stroll',
                 driver_id_tenth: 'piastri', tenth_finish_position: 13, dnf_finish_position: '', season_id: 1)

UserPick.create!(user_id: user4.id, circuit_id: 'villeneuve', driver_id_dnf: 'zhou',
                 driver_id_tenth: 'piastri', tenth_finish_position: 11, dnf_finish_position: '', season_id: 1)

UserPick.create!(user_id: user4.id, circuit_id: 'red_bull_ring', driver_id_dnf: 'bottas',
                 driver_id_tenth: 'ocon', tenth_finish_position: 14, dnf_finish_position: '', season_id: 1)

UserPick.create!(user_id: user4.id, circuit_id: 'silverstone', driver_id_dnf: 'kevin_magnussen',
                 driver_id_tenth: 'bottas', tenth_finish_position: 12, dnf_finish_position: '', season_id: 1)

UserPick.create!(user_id: user4.id, circuit_id: 'hungaroring', driver_id_dnf: 'kevin_magnussen',
                 driver_id_tenth: 'ricciardo', tenth_finish_position: 13, dnf_finish_position: '', season_id: 1)

# Eric's Picks
UserPick.create!(user_id: user5.id, circuit_id: 'jeddah', driver_id_dnf: 'gasly',
                 driver_id_tenth: 'kevin_magnussen', tenth_finish_position: 10, dnf_finish_position: '', season_id: 1)

UserPick.create!(user_id: user5.id, circuit_id: 'albert_park', driver_id_dnf: 'de_vries',
                 driver_id_tenth: 'perez', tenth_finish_position: 5, dnf_finish_position: '', season_id: 1)

UserPick.create!(user_id: user5.id, circuit_id: 'baku', driver_id_dnf: 'leclerc',
                 driver_id_tenth: 'bottas', tenth_finish_position: 18, dnf_finish_position: '', season_id: 1)

UserPick.create!(user_id: user5.id, circuit_id: 'miami', driver_id_dnf: 'zhou',
                 driver_id_tenth: 'kevin_magnussen', tenth_finish_position: 10, dnf_finish_position: '', season_id: 1)

UserPick.create!(user_id: user5.id, circuit_id: 'monaco', driver_id_dnf: 'leclerc',
                 driver_id_tenth: 'ocon', tenth_finish_position: 3, dnf_finish_position: '', season_id: 1)

UserPick.create!(user_id: user5.id, circuit_id: 'catalunya', driver_id_dnf: 'hulkenberg',
                 driver_id_tenth: 'tsunoda', tenth_finish_position: 12, dnf_finish_position: '', season_id: 1)

UserPick.create!(user_id: user5.id, circuit_id: 'villeneuve', driver_id_dnf: 'bottas',
                 driver_id_tenth: 'norris', tenth_finish_position: 13, dnf_finish_position: '', season_id: 1)

UserPick.create!(user_id: user5.id, circuit_id: 'red_bull_ring', driver_id_dnf: 'piastri',
                 driver_id_tenth: 'hulkenberg', tenth_finish_position: 20, dnf_finish_position: '', season_id: 1)

UserPick.create!(user_id: user5.id, circuit_id: 'silverstone', driver_id_dnf: 'piastri',
                 driver_id_tenth: 'hulkenberg', tenth_finish_position: 13, dnf_finish_position: '', season_id: 1)

UserPick.create!(user_id: user5.id, circuit_id: 'hungaroring', driver_id_dnf: 'piastri',
                 driver_id_tenth: 'hulkenberg', tenth_finish_position: 14, dnf_finish_position: '', season_id: 1)

# Camden's Picks
UserPick.create!(user_id: user6.id, circuit_id: 'catalunya', driver_id_dnf: 'kevin_magnussen',
                 driver_id_tenth: 'gasly', tenth_finish_position: 10, dnf_finish_position: '', season_id: 1)

UserPick.create!(user_id: user6.id, circuit_id: 'villeneuve', driver_id_dnf: 'stroll',
                 driver_id_tenth: 'gasly', tenth_finish_position: 12, dnf_finish_position: '', season_id: 1)

UserPick.create!(user_id: user6.id, circuit_id: 'red_bull_ring', driver_id_dnf: 'kevin_magnussen',
                 driver_id_tenth: 'perez', tenth_finish_position: 3, dnf_finish_position: '', season_id: 1)

UserPick.create!(user_id: user6.id, circuit_id: 'silverstone', driver_id_dnf: 'de_vries',
                 driver_id_tenth: 'gasly', tenth_finish_position: 18, dnf_finish_position: '', season_id: 1)

UserPick.create!(user_id: user6.id, circuit_id: 'hungaroring', driver_id_dnf: 'hulkenberg',
                 driver_id_tenth: 'hamilton', tenth_finish_position: 4, dnf_finish_position: '', season_id: 1)

# Belgian GP Picks

UserPick.create!(user_id: user1.id, circuit_id: 'spa', driver_id_dnf: 'sargeant',
                 driver_id_tenth: 'albon', tenth_finish_position: 14, dnf_finish_position: '', season_id: 1)

UserPick.create!(user_id: user2.id, circuit_id: 'spa', driver_id_dnf: 'gasly',
                 driver_id_tenth: 'stroll', tenth_finish_position: 9, dnf_finish_position: '', season_id: 1)

UserPick.create!(user_id: user3.id, circuit_id: 'spa', driver_id_dnf: 'leclerc',
                 driver_id_tenth: 'gasly', tenth_finish_position: 11, dnf_finish_position: '', season_id: 1)

UserPick.create!(user_id: user4.id, circuit_id: 'spa', driver_id_dnf: 'albon',
                 driver_id_tenth: 'tsunoda', tenth_finish_position: 10, dnf_finish_position: '', season_id: 1)

UserPick.create!(user_id: user5.id, circuit_id: 'spa', driver_id_dnf: 'gasly',
                 driver_id_tenth: 'bottas', tenth_finish_position: 12, dnf_finish_position: '', season_id: 1)

UserPick.create!(user_id: user6.id, circuit_id: 'spa', driver_id_dnf: 'alonso',
                 driver_id_tenth: 'ricciardo', tenth_finish_position: 16, dnf_finish_position: '', season_id: 1)

# Dutch GP Picks

UserPick.create!(user_id: user1.id, circuit_id: 'zandvoort', driver_id_dnf: 'lawson',
                 driver_id_tenth: 'tsunoda', tenth_finish_position: 15, dnf_finish_position: '', season_id: 1)

UserPick.create!(user_id: user2.id, circuit_id: 'zandvoort', driver_id_dnf: 'sargeant',
                 driver_id_tenth: 'gasly', tenth_finish_position: 3, dnf_finish_position: 'R', season_id: 1)

UserPick.create!(user_id: user3.id, circuit_id: 'zandvoort', driver_id_dnf: 'alonso',
                 driver_id_tenth: 'gasly', tenth_finish_position: 3, dnf_finish_position: '', season_id: 1)

UserPick.create!(user_id: user4.id, circuit_id: 'zandvoort', driver_id_dnf: 'piastri',
                 driver_id_tenth: 'stroll', tenth_finish_position: 11, dnf_finish_position: '', season_id: 1)

UserPick.create!(user_id: user5.id, circuit_id: 'zandvoort', driver_id_dnf: 'piastri',
                 driver_id_tenth: 'tsunoda', tenth_finish_position: 15, dnf_finish_position: '', season_id: 1)

# Italian GP Picks

UserPick.create!(user_id: user1.id, circuit_id: 'monza', driver_id_dnf: 'leclerc',
                 driver_id_tenth: 'sargeant', tenth_finish_position: 13, dnf_finish_position: '', season_id: 1)

UserPick.create!(user_id: user2.id, circuit_id: 'monza', driver_id_dnf: 'bottas',
                 driver_id_tenth: 'albon', tenth_finish_position: 7, dnf_finish_position: '', season_id: 1)

UserPick.create!(user_id: user3.id, circuit_id: 'monza', driver_id_dnf: 'sainz',
                 driver_id_tenth: 'lawson', tenth_finish_position: 11, dnf_finish_position: '', season_id: 1)

UserPick.create!(user_id: user4.id, circuit_id: 'monza', driver_id_dnf: 'sargeant',
                 driver_id_tenth: 'norris', tenth_finish_position: 8, dnf_finish_position: '', season_id: 1)

UserPick.create!(user_id: user5.id, circuit_id: 'monza', driver_id_dnf: 'piastri',
                 driver_id_tenth: 'norris', tenth_finish_position: 8, dnf_finish_position: '', season_id: 1)

UserPick.create!(user_id: user6.id, circuit_id: 'monza', driver_id_dnf: 'gasly',
                 driver_id_tenth: 'hulkenberg', tenth_finish_position: 17, dnf_finish_position: '', season_id: 1)

# Singapore GP Picks

UserPick.create!(user_id: user1.id, circuit_id: 'marina_bay', driver_id_dnf: 'perez',
                 driver_id_tenth: 'piastri', tenth_finish_position: 7, dnf_finish_position: '', season_id: 1)

UserPick.create!(user_id: user2.id, circuit_id: 'marina_bay', driver_id_dnf: 'zhou',
                 driver_id_tenth: 'kevin_magnussen', tenth_finish_position: 10, dnf_finish_position: '', season_id: 1)

UserPick.create!(user_id: user3.id, circuit_id: 'marina_bay', driver_id_dnf: 'stroll',
                 driver_id_tenth: 'lawson', tenth_finish_position: 9, dnf_finish_position: '', season_id: 1)

UserPick.create!(user_id: user4.id, circuit_id: 'marina_bay', driver_id_dnf: 'tsunoda',
                 driver_id_tenth: 'gasly', tenth_finish_position: 6, dnf_finish_position: 'R', season_id: 1)

UserPick.create!(user_id: user5.id, circuit_id: 'marina_bay', driver_id_dnf: 'stroll',
                 driver_id_tenth: 'ocon', tenth_finish_position: 18, dnf_finish_position: '', season_id: 1)

UserPick.create!(user_id: user6.id, circuit_id: 'marina_bay', driver_id_dnf: 'stroll',
                 driver_id_tenth: 'tsunoda', tenth_finish_position: 19, dnf_finish_position: '', season_id: 1)

# Japanese GP Picks

UserPick.create!(user_id: user1.id, circuit_id: 'suzuka', driver_id_dnf: 'ocon',
                 driver_id_tenth: 'lawson', tenth_finish_position: 11, dnf_finish_position: '', season_id: 1)

UserPick.create!(user_id: user2.id, circuit_id: 'suzuka', driver_id_dnf: 'lawson',
                 driver_id_tenth: 'gasly', tenth_finish_position: 10, dnf_finish_position: '', season_id: 1)

UserPick.create!(user_id: user3.id, circuit_id: 'suzuka', driver_id_dnf: 'stroll',
                 driver_id_tenth: 'lawson', tenth_finish_position: 11, dnf_finish_position: '', season_id: 1)

UserPick.create!(user_id: user4.id, circuit_id: 'suzuka', driver_id_dnf: 'zhou',
                 driver_id_tenth: 'gasly', tenth_finish_position: 10, dnf_finish_position: '', season_id: 1)

UserPick.create!(user_id: user5.id, circuit_id: 'suzuka', driver_id_dnf: 'sargeant',
                 driver_id_tenth: 'alonso', tenth_finish_position: 8, dnf_finish_position: '', season_id: 1)

UserPick.create!(user_id: user6.id, circuit_id: 'suzuka', driver_id_dnf: 'sargeant',
                 driver_id_tenth: 'lawson', tenth_finish_position: 11, dnf_finish_position: '', season_id: 1)

# Qatar GP Picks
UserPick.create!(user_id: user1.id, circuit_id: 'losail', driver_id_dnf: 'stroll',
                 driver_id_tenth: 'ocon', tenth_finish_position: 7, dnf_finish_position: '', season_id: 1)

UserPick.create!(user_id: user2.id, circuit_id: 'losail', driver_id_dnf: 'stroll',
                 driver_id_tenth: 'sainz', tenth_finish_position: 20, dnf_finish_position: '', season_id: 1)

UserPick.create!(user_id: user3.id, circuit_id: 'losail', driver_id_dnf: 'perez',
                 driver_id_tenth: 'tsunoda', tenth_finish_position: 15, dnf_finish_position: '', season_id: 1)

UserPick.create!(user_id: user4.id, circuit_id: 'losail', driver_id_dnf: 'stroll',
                 driver_id_tenth: 'bottas', tenth_finish_position: 8, dnf_finish_position: '', season_id: 1)

UserPick.create!(user_id: user5.id, circuit_id: 'losail', driver_id_dnf: 'alonso',
                 driver_id_tenth: 'norris', tenth_finish_position: 3, dnf_finish_position: '', season_id: 1)

UserPick.create!(user_id: user6.id, circuit_id: 'losail', driver_id_dnf: 'gasly',
                 driver_id_tenth: 'leclerc', tenth_finish_position: 5, dnf_finish_position: '', season_id: 1)

UserPick.create!(user_id: user7.id, circuit_id: 'losail', driver_id_dnf: 'stroll',
                 driver_id_tenth: 'gasly', tenth_finish_position: 12, dnf_finish_position: '', season_id: 1)

# US GP Picks
UserPick.create!(user_id: user1.id, circuit_id: 'americas', driver_id_dnf: 'stroll',
                 driver_id_tenth: 'ocon', tenth_finish_position: 18, dnf_finish_position: '', season_id: 1)

UserPick.create!(user_id: user2.id, circuit_id: 'americas', driver_id_dnf: 'ricciardo',
                 driver_id_tenth: 'ocon', tenth_finish_position: 18, dnf_finish_position: '', season_id: 1)

UserPick.create!(user_id: user3.id, circuit_id: 'americas', driver_id_dnf: 'sargeant',
                 driver_id_tenth: 'bottas', tenth_finish_position: 12, dnf_finish_position: '', season_id: 1)

UserPick.create!(user_id: user4.id, circuit_id: 'americas', driver_id_dnf: 'bottas',
                 driver_id_tenth: 'tsunoda', tenth_finish_position: 8, dnf_finish_position: '', season_id: 1)

UserPick.create!(user_id: user5.id, circuit_id: 'americas', driver_id_dnf: 'gasly',
                 driver_id_tenth: 'tsunoda', tenth_finish_position: 8, dnf_finish_position: '', season_id: 1)

# Mexico City GP Picks
UserPick.create!(user_id: user1.id, circuit_id: 'rodriguez', driver_id_dnf: 'ocon',
                 driver_id_tenth: 'norris', tenth_finish_position: 5, dnf_finish_position: '', season_id: 1)

UserPick.create!(user_id: user2.id, circuit_id: 'rodriguez', driver_id_dnf: 'perez',
                 driver_id_tenth: 'alonso', tenth_finish_position: 18, dnf_finish_position: 'R', season_id: 1)

UserPick.create!(user_id: user3.id, circuit_id: 'rodriguez', driver_id_dnf: 'perez',
                 driver_id_tenth: 'alonso', tenth_finish_position: 18, dnf_finish_position: 'R', season_id: 1)

UserPick.create!(user_id: user4.id, circuit_id: 'rodriguez', driver_id_dnf: 'alonso',
                 driver_id_tenth: 'norris', tenth_finish_position: 5, dnf_finish_position: '', season_id: 1)

UserPick.create!(user_id: user5.id, circuit_id: 'rodriguez', driver_id_dnf: 'sargeant',
                 driver_id_tenth: 'tsunoda', tenth_finish_position: 12, dnf_finish_position: '', season_id: 1)

# São Paulo GP Picks
UserPick.create!(user_id: user1.id, circuit_id: 'interlagos', driver_id_dnf: 'stroll',
                 driver_id_tenth: 'alonso', tenth_finish_position: 3, dnf_finish_position: '', season_id: 1)

UserPick.create!(user_id: user2.id, circuit_id: 'interlagos', driver_id_dnf: 'russell',
                 driver_id_tenth: 'gasly', tenth_finish_position: 7, dnf_finish_position: '', season_id: 1)

UserPick.create!(user_id: user3.id, circuit_id: 'interlagos', driver_id_dnf: 'stroll',
                 driver_id_tenth: 'ocon', tenth_finish_position: 10, dnf_finish_position: '', season_id: 1)

UserPick.create!(user_id: user4.id, circuit_id: 'interlagos', driver_id_dnf: 'stroll',
                 driver_id_tenth: 'ocon', tenth_finish_position: 10, dnf_finish_position: '', season_id: 1)

UserPick.create!(user_id: user5.id, circuit_id: 'interlagos', driver_id_dnf: 'stroll',
                 driver_id_tenth: 'ocon', tenth_finish_position: 10, dnf_finish_position: '', season_id: 1)

# Las Vegas GP Picks
UserPick.create!(user_id: user1.id, circuit_id: 'vegas', driver_id_dnf: 'leclerc',
                 driver_id_tenth: 'bottas', tenth_finish_position: 17, dnf_finish_position: '', season_id: 1)

UserPick.create!(user_id: user2.id, circuit_id: 'vegas', driver_id_dnf: 'hamilton',
                 driver_id_tenth: 'bottas', tenth_finish_position: 17, dnf_finish_position: '', season_id: 1)

UserPick.create!(user_id: user3.id, circuit_id: 'vegas', driver_id_dnf: 'kevin_magnussen',
                 driver_id_tenth: 'ricciardo', tenth_finish_position: 14, dnf_finish_position: '', season_id: 1)

UserPick.create!(user_id: user4.id, circuit_id: 'vegas', driver_id_dnf: 'hulkenberg',
                 driver_id_tenth: 'ricciardo', tenth_finish_position: 14, dnf_finish_position: '', season_id: 1)

UserPick.create!(user_id: user5.id, circuit_id: 'vegas', driver_id_dnf: 'albon',
                 driver_id_tenth: 'kevin_magnussen', tenth_finish_position: 13, dnf_finish_position: '', season_id: 1)

# Abu Dhabi GP
UserPick.create!(user_id: user1.id, circuit_id: 'yas_marina', driver_id_dnf: 'leclerc',
                 driver_id_tenth: 'tsunoda', tenth_finish_position: 8, dnf_finish_position: '', season_id: 1)

UserPick.create!(user_id: user2.id, circuit_id: 'yas_marina', driver_id_dnf: 'sargeant',
                 driver_id_tenth: 'ocon', tenth_finish_position: 12, dnf_finish_position: '', season_id: 1)

UserPick.create!(user_id: user3.id, circuit_id: 'yas_marina', driver_id_dnf: 'alonso',
                 driver_id_tenth: 'tsunoda', tenth_finish_position: 8, dnf_finish_position: '', season_id: 1)

UserPick.create!(user_id: user4.id, circuit_id: 'yas_marina', driver_id_dnf: 'ocon',
                 driver_id_tenth: 'ricciardo', tenth_finish_position: 11, dnf_finish_position: '', season_id: 1)

UserPick.create!(user_id: user5.id, circuit_id: 'yas_marina', driver_id_dnf: 'norris',
                 driver_id_tenth: 'ocon', tenth_finish_position: 12, dnf_finish_position: '', season_id: 1)

# Test Data for a Second Season
# season2 = Season.create!(season_year: '2022')
# user_season8 = UserSeason.create!(user_id: user1.id, season_id: season2.id)

# UserPick.create!(user_id: user1.id, circuit_id: 'jeddah', driver_id_dnf: 'piastri',
#   driver_id_tenth: 'bottas', tenth_finish_position: 18, dnf_finish_position: '', season_id: 2)

UserPick.all.each do |pick|
  pick.calculate_points
  pick.dnf_points
end

# 2023 season
user_season1.calculate_total_points
user_season2.calculate_total_points
user_season3.calculate_total_points
user_season4.calculate_total_points
user_season5.calculate_total_points
user_season6.calculate_total_points
user_season7.calculate_total_points

# 2024 season
user_season8.calculate_total_points
user_season9.calculate_total_points
user_season10.calculate_total_points
user_season11.calculate_total_points
user_season12.calculate_total_points
user_season13.calculate_total_points
user_season14.calculate_total_points
