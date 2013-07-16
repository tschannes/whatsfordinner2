class Reservation < ActiveRecord::Base
  attr_accessible :size, :time, :restaurant_id, :user_id

  belongs_to :user
  belongs_to :restaurant

  # validates :time, :presence => true
  validate :proper_reservation_size
  # after_create :calc_seats_remaining


  def proper_reservation_size
    if size && (size < 2 || size > 20)
      errors.add(:size, "Party size must be between 2 and 20")
    end
  end

  def number_of_seats_available
    if size && (size > num_seats)
      errors.add(:size, "Party too large for restaurant")
    end
  end

  def reservation_time_slot_open
  end

  def calc_seats_remaining
    num_seats = @restaurant.num_seats
    num_seats = num_seats.to_i
    num_seats = num_seats - self.size
    num_seats = num_seats.to_s
  end

end
# is the reservation btw 2..20
# number of seats available?
# is the restaurant open
# is the time slot available
