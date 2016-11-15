class Booking < ApplicationRecord
  belongs_to :guide
  belongs_to :profile
  belongs_to :status
  has_many :reviews

  validates :start_date, presence: true
  validates :end_date, presence: true
  validates :guide, presence: true
  validates :profile, presence: true
end
