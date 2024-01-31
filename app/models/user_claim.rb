# app/models/user_claim.rb
class UserClaim < ApplicationRecord
  has_many :user_claims_users
  has_many :users, through: :user_claims_users
end
