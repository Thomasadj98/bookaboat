class BookingsController < ApplicationController
  def create
    @user = current_user
    @boat = Boat.find(params[:boat_id])
    @booking = Booking.new(booking_params)
    @booking.user = @user
    @booking.boat = @boat
    @booking.save!
    if @booking.save
      redirect_to boat_path(@boat), notice: "Congratulations you've booked
      #{@boat.name} for #{@booking.guests} people on #{@booking.booking_date} for the low price of €#{@boat.price}!"
    else
      render :new
    end
  end

  private

  def booking_params
    params.require(:booking).permit(:booking_date, :guests)
  end
end

# Add visual feedback when booking has been confirmed on the same
# page (view).

# Complete booking functionality where the host can accept
# a booking
