# frozen_string_literal: true

require 'rails_helper'

RSpec.describe UserPick, type: :model do
  describe 'relationships and validations' do
    it { should belong_to :user }

    it { should validate_presence_of :user_id }
    it { should validate_presence_of :driver_id }
    it { should validate_presence_of :circuit_id }
    it { should validate_presence_of :points_earned }
  end
end
