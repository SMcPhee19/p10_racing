# frozen_string_literal: true

require 'rails_helper'

RSpec.describe SeasonsHelper, vcr: { record: :new_episodes }, type: :helper do
  describe '#formatted_date' do
    it 'formats date string' do
      date_string = '2024-01-16'
      formatted_date = helper.formatted_date(date_string)
      expect(formatted_date).to eq('January 16')
    end
  end

  describe '#formatted_time' do
    it 'formats time string' do
      time_string = '14:30:00'
      formatted_time = helper.formatted_time(time_string)
      expect(formatted_time).to eq('02:30 PM')
    end
  end
end
