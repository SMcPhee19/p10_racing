# frozen_string_literal: true

require 'rails_helper'

RSpec.describe UserSeason, type: :model do
  describe 'relationshipos' do
    it { should belong_to :user }
    it { should belong_to :season }
  end
end
