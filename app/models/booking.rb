class Booking < ApplicationRecord
  belongs_to :guide
  belongs_to :profile
  has_many :status_flows
  has_many :reviews

  validates :start_date, presence: true
  validates :days, inclusion: { in: 1..10 }
  validates :guide, presence: true
  validates :profile, presence: true

  def set_status_pending_payment
    status_flow = StatusFlow.new(booking_id: @booking.id, status_id: Status.find_by_code(10).id)
    status_flow.save
  end

end
