require 'rails_helper'

RSpec.describe F1Service do
  it 'returns drivers for a season', vcr:{record: :new_episodes} do
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

  it 'returns results for a specific round in a season', vcr:{record: :new_episodes} do
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

  it 'returns the constructors for a season', vcr:{record: :new_episodes} do
    season = 2023
    constructors_response = F1Service.new.get_constructors(season)

    expect(constructors_response).to be_a(Hash)
    expect(constructors_response).to have_key(:MRData)
    expect(constructors_response[:MRData]).to have_key(:ConstructorTable)
    expect(constructors_response[:MRData][:ConstructorTable]).to have_key(:Constructors)
    expect(constructors_response[:MRData][:ConstructorTable][:Constructors]).to be_an(Array)
    expect(constructors_response[:MRData][:ConstructorTable][:Constructors].count).to eq(10)
  end
end