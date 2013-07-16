class Reservation < ActiveRecord::Base
  attr_accessible :size, :time, :restaurant_id, :user_id

  belongs_to :user
  belongs_to :restaurant

  # validates :time, :presence => true
  validate :proper_reservation_size

  # before_create :default_customer
  # before_create :default_restaurant


  def default_customer
    self.user_id = 6
  end

  def default_restaurant
    self.restaurant_id = 1
  end

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
