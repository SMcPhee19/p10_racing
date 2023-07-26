# frozen_string_literal: true

class User < ApplicationRecord
  has_many :user_seasons
  has_many :seasons, through: :user_seasons
  has_many :user_picks

  validates :name, presence: true
  validates :total_points, presence: true
end