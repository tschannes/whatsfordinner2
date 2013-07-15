class ReservationsController < ApplicationController
  def index
  end

  def create
    @reservation = @restaurant.reservations.find(params[:restaurant_id])
  end

  def new
    @restaurant = Restaurant.find(params[:restaurant_id])
    @reservation = Reservation.new
  end

  def edit
  end

  def show
  end

  def update
  end

  def destroy
  end

end
