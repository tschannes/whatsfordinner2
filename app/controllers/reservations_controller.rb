class ReservationsController < ApplicationController
  def index
  end

  def create
    @restaurant = Restaurant.find(params[:restaurant_id])
    @reservation = Reservation.new(params[:reservation])

    # Reservation.new( {:size => "400", :time => "9"} )
    # don't do this -  params[:reservation][:restaurant_id]

    flash[:notice] = @reservation
    # @reservation = @restaurant.reservations.find(params[:restaurant_id])
    if proper_reservation_size?(@reservation.size)
          redirect_to user_path(current_user), :notice => "You successfully made a reservation!"
        else
          render "reservations/new", :notice => "Something went wrong!"
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
