# frozen_string_literal: true

class User < ApplicationRecord
  has_many :user_seasons
  has_many :seasons, through: :user_seasons
  has_many :user_picks

  validates :name, presence: true

  # def calculate_total_points
  #   sum = 0

  #   user_picks.each do |user_pick|
  #     sum += user_pick.points_earned
  #   end
  #   update(total_points: sum)
  # end
end
