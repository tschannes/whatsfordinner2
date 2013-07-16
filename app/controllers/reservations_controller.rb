class ReservationsController < ApplicationController
   before_filter :load_restaurant

  def index
  end

  def create
    # raise params[:reservation].inspect
    # @reservation = Reservation.new(
    #    time: params[:reservation][:time],
    #    size: params[:reservation][:size],
    #    restaurant_id: params[:restaurant_id],
    #    user_id: current_user.id)
    @reservation = @restaurant.reservations.build(params[:reservation])
    @reservation.user = current_user
    # raise @reservation.inspect


    if @reservation.save
      flash[:notice] = "Reservation created!"
      redirect_to user_path(current_user)
    else
      flash[:notice] = @reservation.errors.full_messages.first
      render 'new'
    end



    # @restaurant = Restaurant.find(params[:restaurant_id])
    @reservation = Reservation.new(params[:reservation])
    # @user = @reservation.user_id

    # if @reservation.save
    #   flash[:notice] = "You successfully made a reservation!"
    #   redirect_to user_path(current_user)
    # else
    #   flash[:notice] = @reservation.errors.full_messages.first
    #   render "reservations/new"
    # end
  end

  def new
    # @restaurant = Restaurant.find(params[:restaurant_id])
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



  def time_slot_selected

  end

# is the reservation btw 2..20
# number of seats available?
# is the restaurant open
# is the time slot available





  private
    def load_restaurant
          @restaurant = Restaurant.find(params[:restaurant_id])
    end


end
