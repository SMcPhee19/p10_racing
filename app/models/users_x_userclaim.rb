# frozen_string_literal: true
# app/models/users_x_userclaim.rb
class UsersXUserclaim < ApplicationRecord
  belongs_to :user
  belongs_to :user_claim
end