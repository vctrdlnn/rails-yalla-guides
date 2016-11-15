class Profile < ApplicationRecord
  belongs_to :user
  has_many :reservations
  has_many :bookings
  has_many :guides

  validates :role, presence: true, inclusion: { in: %w(host guest admin) }
end
