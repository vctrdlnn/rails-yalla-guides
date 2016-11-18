class StatusFlow < ApplicationRecord
  belongs_to :booking
  belongs_to :status

  validates :booking, presence: true
  validates :status, presence: true, uniqueness: { scope: :booking,
    message: "status already occured" }

  def code
    status.code
  end
end
