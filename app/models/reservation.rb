class Reservation < ActiveRecord::Base
  attr_accessible :size, :time

  belongs_to :user
  belongs_to :restaurant


end
