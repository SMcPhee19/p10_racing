require 'rails_helper'

RSpec.describe F1Service, vcr:{record: :new_episodes} do
  it 'returns drivers for a season' do
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

  it 'returns results for a specific round in a season' do
    season = 2023
    round = 7
    response = F1Service.new.get_results(season, round)

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
end