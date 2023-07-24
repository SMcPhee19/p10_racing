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
end