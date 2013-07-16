class Reservation < ActiveRecord::Base
  attr_accessible :size, :time

  belongs_to :user
  belongs_to :restaurant

  validates :time, :presence => true
  validate :proper_reservation_size
  validate :number_of_seats_available
  # probably need to define:
  # how long do people eat for


  # make sure that size is set to something
  # make sure that restaurant time is between opening hours of restaurant - but where is this defined?

  # eventually..
  # make sure there are no conflicts
    # make sure at all times that the reservation being created has enough seats remaining (for that entire time period)



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

end
