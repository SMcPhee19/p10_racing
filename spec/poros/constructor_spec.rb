require 'rails_helper'

RSpec.describe RaceResult, vcr:{record: :new_episodes}, type: :poro do
  describe 'initialize' do
    it 'exists and has attributes' do
      data = {
        "constructorId": "mercedes",
        "url": "http://en.wikipedia.org/wiki/Mercedes-Benz_in_Formula_One",
        "name": "Mercedes",
        "nationality": "German"
      }

      constructor = Constructor.new(data)
      expect(constructor).to be_a(Constructor)
      expect(constructor.constructor_id).to eq("mercedes")
      expect(constructor.name).to eq("Mercedes")
      expect(constructor.nationality).to eq("German")
    end
  end
end