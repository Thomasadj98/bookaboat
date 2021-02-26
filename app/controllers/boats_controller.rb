class BoatsController < ApplicationController
  def index
    @boats = Boat.all
      if params[:query].present?
        sql_query = " \
        boats.name @@ :query \
        OR boats.description @@ :query \
        OR boats.city @@ :query \
        "
        @boats = Boat.where(sql_query, query: "%#{params[:query]}%")
      else
        @boats = Boat.all

      end
         @markers = @boats.geocoded.map do |boat|
      {
        lat: boat.latitude,
        lng: boat.longitude,
        infoWindow: render_to_string(partial: "info_window", locals: { boat: boat })
      }
    end
  end

  def new
    @boat = Boat.new
  end

  def show
    @boat = Boat.find(params[:id])
    @markers = [{ lat: @boat.latitude, lng: @boat.longitude }]
    @booking = Booking.new
  end

  def create
    @user = current_user
    @boat = Boat.new(boat_params)
    @boat.user = @user
    if @boat.save
      redirect_to root_path
    else
      render :new
    end
  end

  def my_boats
    @boats = Boat.all
    @my_boats = current_user.boats
    @markers = @my_boats.geocoded.map do |boat|
      {
        lat: boat.latitude,
        lng: boat.longitude,
        infoWindow: render_to_string(partial: "info_window", locals: { boat: boat })
      }
    end
  end

  private

  def boat_params
    params.require(:boat).permit(:name, :price, :capacity, :description, :city, :photo, :address)
  end
end
