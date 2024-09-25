class Booking < ApplicationRecord
  belongs_to :room
  belongs_to :rate_plan
  belongs_to :calendar

  validates :check_in, :check_out, :name, :email, :phone_number, presence: true
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }
  validate :check_in_before_check_out

  after_create :update_reservation_number
  after_create :decrease_calendar_availability
  after_destroy :restore_calendar_availability

  private

  def check_in_before_check_out
    errors.add(:check_in, "must be before check-out date") if check_in >= check_out
  end

  def update_reservation_number
    self.update(reservation_number: "#{DateTime.now.to_date}-#{SecureRandom.hex(6)}-#{self.id}")
  end

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
