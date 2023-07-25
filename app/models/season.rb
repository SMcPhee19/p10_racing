# frozen_string_literal: true

class Season < ApplicationRecord
  validates_uniqueness_of :season_year

  has_many :user_seasons
  has_many :users, through: :user_seasons
end
