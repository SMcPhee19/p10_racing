# frozen_string_literal: true

class UserSeason < ApplicationRecord
  belongs_to :user
  belongs_to :season
  has_many :user_picks, through: :user
  validates :total_points, presence: true

  def calculate_total_points
    sum = 0
    user_picks.where(season_id: season_id).each do |user_pick|
      sum += user_pick.points_earned
    end
    update(total_points: sum)
  end
end
