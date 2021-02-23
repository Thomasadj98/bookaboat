class BoatsController < ApplicationController
  def index
    @boats = Boat.all
  end

  def new
    @boat = Boat.new
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

  private

  def boat_params
    params.require(:boat).permit(:name, :price, :capacity, :description)
  end
end
