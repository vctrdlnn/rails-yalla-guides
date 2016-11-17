class Step < ApplicationRecord
  belongs_to :guide

  validates :title, presence: true
  validates :establishment, presence: true
  validates :address, presence: true
  validates :city, presence: true
end
