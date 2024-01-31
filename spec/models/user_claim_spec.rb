RSpec.describe UserClaim, type: :model do
  describe 'associations and validations' do
    it { should have_many(:user_claims_users) }
    it { should have_many(:users).through(:user_claims_users) }
  end
end