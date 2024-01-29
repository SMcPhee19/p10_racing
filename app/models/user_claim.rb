# app/models/user_claim.rb
class UserClaim < ApplicationRecord
  self.table_name = 'userclaims'
  has_many :users_x_userclaims
  has_many :users, through: :users_x_userclaims
end