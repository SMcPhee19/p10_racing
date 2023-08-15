# frozen_string_literal: true

module UserPicksHelper
  def toggle_direction(column)
    params[:sort] == column && params[:direction] == 'asc' ? 'desc' : 'asc'
  end
end
