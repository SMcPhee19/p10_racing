# frozen_string_literal: true

class UserPick < ApplicationRecord
  belongs_to :user

  validates_presence_of :user_id, :driver_id, :circuit_id, :points_earned
end
