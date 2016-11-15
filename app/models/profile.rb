class Profile < ApplicationRecord
  belongs_to :user
  has_many :reservations
  has_many :bookings

  validates :role, presence: true, inclusion: { in: %w(host guest admin) }
end
