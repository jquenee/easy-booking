class CreateBookings < ActiveRecord::Migration
  def change
    create_table :bookings do |t|
      t.string :name
      t.string :phone
      t.date :start
      t.date :end
      t.integer :full_price
      t.integer :reduced_price

      t.timestamps null: false
    end
  end
end
