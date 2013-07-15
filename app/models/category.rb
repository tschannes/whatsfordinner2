class Category < ActiveRecord::Base
  attr_accessible :food_type, :id

  has_many :restaurants

end
