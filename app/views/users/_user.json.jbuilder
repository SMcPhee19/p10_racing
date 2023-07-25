# frozen_string_literal: true

json.extract! user, :id, :name, :total_points, :created_at, :updated_at
json.url user_url(user, format: :json)
