class Guide < ApplicationRecord
  belongs_to :profile
  has_many :bookings
  mount_uploader :photo, PhotoUploader

  validates :title, presence: true
  validates :description, presence: true
  validates :address, presence: true
  validates :city, presence: true
  validates :photo, presence: true
  validates :daily_price, presence: true
  validates :category, presence: true

  geocoded_by :address
  after_validation :geocode, if: :address_changed?
end
