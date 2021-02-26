class Boat < ApplicationRecord
  belongs_to :user
  has_many :bookings, dependent: :destroy

  has_one_attached :photo

  validates :name, presence: true
  validates :price, presence: true, numericality: true
  validates :capacity, presence: true, numericality: true
  validates :description, presence: true, length: { minimum: 30 }
  validates :address, presence: true

  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
end
