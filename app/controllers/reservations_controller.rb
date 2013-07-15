class ReservationsController < ApplicationController
  def index
  end

  def create
    @restaurant = Restaurant.find(params[:restaurant_id])
    @reservation = Reservation.new(params[:reservation])

    if @reservation.save
      flash[:notice] = "You successfully made a reservation!"
      redirect_to user_path(current_user)
    else
      flash[:notice] = @reservation.errors.full_messages.first
      render "reservations/new"
    end
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



# is the reservation btw 2..20
# number of seats available?
# is the restaurant open
# is the time slot available


end
