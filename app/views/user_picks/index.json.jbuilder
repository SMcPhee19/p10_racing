# frozen_string_literal: true

json.array! @user_picks, partial: 'user_picks/user_pick', as: :user_pick
