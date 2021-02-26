class BookingsController < ApplicationController
  def create
    @user = current_user
    @boat = Boat.find(params[:boat_id])
    @booking = Booking.new(booking_params)
    @booking.user = @user
    @booking.boat = @boat
    @booking.save!
  end

  private

  def booking_params
    params.require(:booking).permit(:booking_date, :guests)
  end
end

# booking gives error message when negative or 0. But not a very
# friendly one.
# Boat.capacity can't exceed Booking.guest (see booking.rb)
# Add visual feedback when booking has been confirmed on the same
# page (view).

# Complete booking functionality where the host can accept
# a booking
