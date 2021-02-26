class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :boat

  validates :booking_date, presence: true
  validates :guests, numericality: { greater_than: 0 }
end

# class Order < ApplicationRecord
#   validates :card_number, presence: true, if: :paid_with_card?

# Can I validate that the Booking.guest doesn't exceed Boat.capacity? If yes, how?
