class Booking < ApplicationRecord
  belongs_to :guide
  belongs_to :profile
  has_many :status_flows
  has_many :statuses, through: :status_flows
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
    # TODO: Send email to guide
  end

  def set_status_confirmed
    status_flow = StatusFlow.new(booking_id: self.id, status_id: Status.find_by_code(25).id)
    status_flow.save
  end

  def set_status_rejected
    status_flow = StatusFlow.new(booking_id: self.id, status_id: Status.find_by_code(29).id)
    status_flow.save
  end

  def set_status_cancelled_by_guide
    status_flow = StatusFlow.new(booking_id: self.id, status_id: Status.find_by_code(49).id)
    status_flow.save
  end

  def paid?
    statuses.find_by_code(15).present?
  end

  def confirmed?
    statuses.find_by_code(25).present?
  end

  def rejected?
    statuses.find_by_code(29).present?
  end

  def cancelled?
    statuses.find_by_code(39).present? || statuses.find_by_code(49).present?
  end

  def completed?
    if cancelled?
      false
    else
      end_date < Date.today
    end
  end
end
