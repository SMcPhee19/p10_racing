# frozen_string_literal: true

module SeasonsHelper
  def formatted_date(date_string)
    Date.parse(date_string).strftime('%B %d')
  end

  def formatted_time(time_string)
    time = time_string.to_time.in_time_zone('Mountain Time (US & Canada)')
    time.strftime('%I:%M %p')
  end
end
