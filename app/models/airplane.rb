class Airplane < ApplicationRecord
  belongs_to :owner, class_name: 'User'
  has_many :bookings
  has_many :ratings

  validates :capacity, presence: true, numericality: { only_integer: true }
  validates :model, presence: true
  validates :price, presence: true, numericality: true
  validates :rating, presence: true, inclusion: { in: (0.0..5.0) }, numericality: true
end
