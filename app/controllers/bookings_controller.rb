class BookingsController < ApplicationController
  def create
    @user = current_user
    @boat = Boat.find(params[:boat_id])
    @booking = Booking.new(booking_params)
    @booking.user = @user
    @booking.boat = @boat
    @booking.save!
    redirect_to root_path
    # redirect to different page tomorrow. No redirects to crashing
    # homepage.
  end

  private

  def booking_params
    params.require(:booking).permit(:booking_date, :guests)
  end
end
