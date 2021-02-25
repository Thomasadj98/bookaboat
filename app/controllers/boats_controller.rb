class BoatsController < ApplicationController
  def index
    @boats = Boat.all
  end

  def new
    @boat = Boat.new
  end

  def show
    @boat = Boat.find(params[:id])
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
    @my_boats = @boats.select do |boat|
      current_user == boat.user
    end
    # @my_boats2 = Boat.where(user_id: current_user.id)
  end

  private

  def boat_params
    params.require(:boat).permit(:name, :price, :capacity, :description, :city)
  end
end
