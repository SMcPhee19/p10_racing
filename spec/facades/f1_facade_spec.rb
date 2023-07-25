# frozen_string_literal: true

require 'rails_helper'

RSpec.describe F1Facade, vcr: { record: :new_episodes } do
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

  describe 'get_result' do
    it 'returns a result object' do
      result = @facade.get_result(2023, 7)

      expect(result).to be_a(RaceResult)
    end
  end

  describe 'get_constructors' do
    it 'returns a constructor object' do
      constructors = @facade.get_constructors(2023)

      expect(constructors).to be_a(Array)
      expect(constructors).to all(be_a(Constructor))
    end
  end

  describe 'get_schedule' do
    it 'returns a schedule object' do
      schedule = @facade.get_schedule(2023)

      expect(schedule).to be_a(Schedule)
    end
  end
end
