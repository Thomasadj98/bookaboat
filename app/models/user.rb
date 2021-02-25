class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :boats, dependent: :destroy
  has_many :bookings, dependent: :destroy
  has_many :rented_boats, through: :bookings, foreign_key: "boat_id", class_name: "Boat"

  has_one_attached :photo

  def host?
    host == true
  end
end
