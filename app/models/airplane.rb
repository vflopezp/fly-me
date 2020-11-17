class Airplane < ApplicationRecord
  belongs_to :owner, class_name: 'User'
  has_many :bookings
  has_many :ratings
  has_many_attached :photos

  validates :capacity, presence: true, numericality: { only_integer: true }
  validates :model, presence: true
  validates :price, presence: true, numericality: true
  validates :rating, inclusion: { in: (0.0..5.0) }, numericality: true
  # validate :owner_only

  # def owner_only
  #   errors.add(owner, "owner has to be an owner") if owner.role != "owner"
  # end
end
