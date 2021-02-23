class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :boat

  validates :start_date, presence: true
  validates :end_date, presence: true
end


# class Order < ApplicationRecord
#   validates :card_number, presence: true, if: :paid_with_card?
