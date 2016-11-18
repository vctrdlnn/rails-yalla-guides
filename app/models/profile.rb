class Profile < ApplicationRecord
  belongs_to :user
  has_many :reservations
  has_many :bookings
  has_many :guides

  validates :role, presence: true, inclusion: { in: %w(host guest admin) }
  validates :photo, presence: true
  validates :hometown, presence: true
  validates :birthday, presence: true
  validates :aboutme, presence: true

  mount_uploader :photo, PhotoUploader


  def pending_confirmations
    fail
  end
end
