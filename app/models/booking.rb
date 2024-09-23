class Booking < ApplicationRecord
  belongs_to :room
  belongs_to :rate_plan
  belongs_to :calendar

  after_create :decrease_calendar_availability
  after_destroy :restore_calendar_availability

  private

  def decrease_calendar_availability
    (check_in.to_date..check_out.to_date).each do |date|
      calendar = Calendar.find_by(date: date, room_id: room_id)
      calendar.update(availability: calendar.availability - 1) if calendar
    end
  end

  def restore_calendar_availability
    (check_in.to_date..check_out.to_date).each do |date|
      calendar = Calendar.find_by(date: date, room_id: room_id)
      calendar.update(availability: calendar.availability + 1) if calendar
    end
  end
end
