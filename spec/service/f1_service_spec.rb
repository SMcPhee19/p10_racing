# frozen_string_literal: true

require 'rails_helper'

RSpec.describe F1Service do
  it 'returns drivers for a season', vcr: { record: :new_episodes } do
    season = 2023
    response = F1Service.new.get_drivers(season)

    expect(response).to be_a(Hash)
    expect(response).to have_key(:MRData)
    expect(response[:MRData]).to have_key(:DriverTable)
    expect(response[:MRData][:DriverTable]).to have_key(:season)
    expect(response[:MRData][:DriverTable][:season]).to eq(season.to_s)
    expect(response[:MRData][:DriverTable]).to have_key(:Drivers)
    expect(response[:MRData][:DriverTable][:Drivers]).to be_an(Array)
    expect(response[:MRData][:DriverTable][:Drivers].count).to eq(21)
  end

  it 'returns results for a specific round in a season', vcr: { record: :new_episodes } do
    season = 2023
    round = 7
    response = F1Service.new.get_result(season, round)

    expect(response).to be_a(Hash)
    expect(response).to have_key(:MRData)
    expect(response[:MRData]).to have_key(:RaceTable)
    expect(response[:MRData][:RaceTable]).to have_key(:season)
    expect(response[:MRData][:RaceTable][:season]).to eq(season.to_s)
    expect(response[:MRData][:RaceTable]).to have_key(:round)
    expect(response[:MRData][:RaceTable][:round]).to eq(round.to_s)
    expect(response[:MRData][:RaceTable]).to have_key(:Races)
    expect(response[:MRData][:RaceTable][:Races]).to be_an(Array)
    expect(response[:MRData][:RaceTable][:Races][0]).to have_key(:Results)
    expect(response[:MRData][:RaceTable][:Races][0][:Results].count).to eq(20)
  end

  it 'returns the constructors for a season', vcr: { record: :new_episodes } do
    season = 2023
    response = F1Service.new.get_constructors(season)

    expect(response).to be_a(Hash)
    expect(response).to have_key(:MRData)
    expect(response[:MRData]).to have_key(:ConstructorTable)
    expect(response[:MRData][:ConstructorTable]).to have_key(:Constructors)
    expect(response[:MRData][:ConstructorTable][:Constructors]).to be_an(Array)
    expect(response[:MRData][:ConstructorTable][:Constructors].count).to eq(10)
  end

  it 'returns the schedule for a season', vcr: { record: :new_episodes } do
    season = 2023

    response = F1Service.new.get_schedule(season)

    expect(response).to be_a(Hash)
    expect(response).to have_key(:MRData)
    expect(response[:MRData]).to have_key(:RaceTable)
    expect(response[:MRData][:RaceTable]).to have_key(:Races)
    expect(response[:MRData][:RaceTable][:Races]).to be_an(Array)
    expect(response[:MRData][:RaceTable][:Races].count).to eq(22)

    response[:MRData][:RaceTable][:Races].each do |race|
      expect(race).to have_key(:season)
      expect(race[:season]).to eq(season.to_s)
      expect(race).to have_key(:round)
      expect(race[:round]).to be_a(String)
      expect(race).to have_key(:raceName)
      expect(race[:raceName]).to be_a(String)
      expect(race).to have_key(:Circuit)
      expect(race[:Circuit]).to have_key(:circuitName)
      expect(race[:Circuit][:circuitName]).to be_a(String)
      expect(race).to have_key(:date)
      expect(race[:date]).to be_a(String)
      expect(race).to have_key(:time)
      expect(race[:time]).to be_a(String)
      expect(race).to have_key(:FirstPractice)
      expect(race[:FirstPractice]).to be_a(Hash)
      expect(race).to have_key(:Qualifying)
      expect(race[:Qualifying]).to be_a(Hash)
    end
  end

  it 'returns the driver standings for a season', vcr: { record: :new_episodes } do
    season = 2023
    response = F1Service.new.get_driver_standings(season)

    expect(response).to be_a(Hash)
    expect(response).to have_key(:MRData)
    expect(response[:MRData]).to have_key(:StandingsTable)
    expect(response[:MRData][:StandingsTable]).to have_key(:StandingsLists)
    expect(response[:MRData][:StandingsTable][:StandingsLists]).to be_an(Array)

    response[:MRData][:StandingsTable][:StandingsLists][0][:DriverStandings].each do |driver|
      expect(driver).to have_key(:position)
      expect(driver).to have_key(:points)
      expect(driver).to have_key(:wins)
      expect(driver).to have_key(:Driver)
      expect(driver[:Driver]).to have_key(:driverId)
      expect(driver[:Driver]).to have_key(:permanentNumber)
      expect(driver[:Driver]).to have_key(:code)
      expect(driver[:Driver]).to have_key(:givenName)
      expect(driver[:Driver]).to have_key(:familyName)
      expect(driver).to have_key(:Constructors)
      expect(driver[:Constructors]).to be_an(Array)
      expect(driver[:Constructors][0]).to have_key(:constructorId)
      expect(driver[:Constructors][0]).to have_key(:name)
    end
  end

  it 'returns the constructor standings for a season', vcr: { record: :new_episodes } do
    season = 2023
    response = F1Service.new.get_constructor_standings(season)

    expect(response).to be_a(Hash)
    expect(response).to have_key(:MRData)
    expect(response[:MRData]).to have_key(:StandingsTable)
    expect(response[:MRData][:StandingsTable]).to have_key(:StandingsLists)
    expect(response[:MRData][:StandingsTable][:StandingsLists]).to be_an(Array)
    expect(response[:MRData][:StandingsTable][:StandingsLists][0]).to have_key(:season)
    expect(response[:MRData][:StandingsTable][:StandingsLists][0][:season]).to eq(season.to_s)
    expect(response[:MRData][:StandingsTable][:StandingsLists][0]).to have_key(:ConstructorStandings)
    expect(response[:MRData][:StandingsTable][:StandingsLists][0][:ConstructorStandings]).to be_an(Array)

    response[:MRData][:StandingsTable][:StandingsLists][0][:ConstructorStandings].each do |constructor|
      expect(constructor).to have_key(:position)
      expect(constructor).to have_key(:points)
      expect(constructor).to have_key(:wins)
      expect(constructor).to have_key(:Constructor)
      expect(constructor[:Constructor]).to have_key(:constructorId)
      expect(constructor[:Constructor]).to have_key(:name)
    end
  end

  it 'returns the results of the latest race', vcr: { record: :new_episodes } do
    response = F1Service.new.get_latest_race

    expect(response).to be_a(Hash)
    expect(response).to have_key(:MRData)
    expect(response[:MRData]).to have_key(:RaceTable)
    expect(response[:MRData][:RaceTable]).to have_key(:season)
    expect(response[:MRData][:RaceTable]).to have_key(:round)
    expect(response[:MRData][:RaceTable]).to have_key(:Races)
    expect(response[:MRData][:RaceTable][:Races][0]).to have_key(:Results)
    response[:MRData][:RaceTable][:Races][0][:Results].each do |result|
      expect(result).to have_key(:Driver)
      expect(result[:Driver]).to have_key(:driverId)
      expect(result[:Driver]).to have_key(:givenName)
      expect(result[:Driver]).to have_key(:familyName)
    end
  end

  it 'returns the latest qualifying results', vcr: { record: :new_episodes } do
end
