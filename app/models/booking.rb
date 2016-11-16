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
    status_flow = StatusFlow.new(booking_id: self.id, status_id: Status.find_by_code(10).id)
    status_flow.save
  end

  def set_status_payment_confirmed
    status_flow = StatusFlow.new(booking_id: self.id, status_id: Status.find_by_code(15).id)
    status_flow.save
  end

  def set_status_pending_confirmation
    status_flow = StatusFlow.new(booking_id: self.id, status_id: Status.find_by_code(20).id)
    status_flow.save
  end

end
