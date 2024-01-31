# frozen_string_literal: true

RSpec.describe UserClaimsUser, type: :model do
  describe 'associations and validations' do
    it { should belong_to :user }
    it { should belong_to :user_claim }
  end
end
