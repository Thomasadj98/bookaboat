class Boat < ApplicationRecord
  belongs_to :user
  has_many :bookings
  validates :name, presence: true
  validates :price, presence: true, numericality: true
  validates :capacity, presence: true, numericality: true
  validates :description, presence: true, length: { minimum: 30 }
  validates :city, presence: true
end
