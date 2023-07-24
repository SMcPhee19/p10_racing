require 'rails_helper'

RSpec.describe F1Facade, vcr:{record: :new_episodes} do
  before(:each) do
    @facade = F1Facade.new
  end

  describe 'initialize' do
    it 'exists' do
      expect(@facade).to be_a(F1Facade)
    end
  end

  describe 'get_drivers' do
    it 'returns an array of driver objects' do
      drivers = @facade.get_drivers(2023) 

      expect(drivers).to be_a(Array)
      expect(drivers).to all(be_a(Driver))
    end
  end
end