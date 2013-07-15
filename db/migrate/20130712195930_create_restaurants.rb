class CreateRestaurants < ActiveRecord::Migration
  def change
    create_table :restaurants do |t|
      t.string :address
      t.string :neighborhood
      t.string :price_range
      t.text :summary
      t.text :menu
      t.string :timeslots_available
      t.string :num_seats

      t.timestamps
    end
  end
end
