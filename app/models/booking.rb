class Booking < ApplicationRecord
  belongs_to :guide
  belongs_to :profile
  belongs_to :status
end
