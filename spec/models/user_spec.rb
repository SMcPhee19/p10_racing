# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'relationships and validations' do
    it { should have_many(:user_seasons) }
    it { should have_many(:seasons).through(:user_seasons) }
    it { should have_many(:user_picks) }

    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:total_points) }
  end
end
