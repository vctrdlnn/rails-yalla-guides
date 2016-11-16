class Booking < ApplicationRecord
  belongs_to :guide
  belongs_to :profile
  belongs_to :status
  has_many :reviews

  validates :start_date, presence: true
  validates :days, inclusion: { in: 1..10 }
  validates :guide, presence: true
  validates :profile, presence: true
end
