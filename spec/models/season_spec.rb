# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Season, type: :model do
  describe 'relationships and validations' do
    it { should have_many(:user_seasons) }
    it { should have_many(:users).through(:user_seasons) }

    it { should validate_uniqueness_of(:season_year) }
  end
end
