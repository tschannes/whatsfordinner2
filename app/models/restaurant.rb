class Restaurant < ActiveRecord::Base
  attr_accessible :name, :address, :menu, :neighborhood, :num_seats, :price_range, :summary, :timeslots_available, :category_id

  has_many :reservations
  has_many :user, through: :reservations

  belongs_to :category

  validates :address, :menu, :neighborhood, :num_seats, :price_range, :summary, :timeslots_available, :category_id, :presence => true
  
end
