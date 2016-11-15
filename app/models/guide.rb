class Guide < ApplicationRecord
  belongs_to :profile
  has_many :bookings
  mount_uploader :photo, PhotoUploader

  validates :title, presence: true
  validates :description, presence: true
  validates :start_address, presence: true
  validates :end_address, presence: true
  validates :city, presence: true
  validates :photo, presence: true
  validates :hourly_price, presence: true
  validates :category, presence: true
end
