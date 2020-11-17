class CreateBookings < ActiveRecord::Migration[6.0]
  def change
    create_table :bookings do |t|
      t.string :status, default: "pending"
      t.datetime :start_date
      t.datetime :end_date 
      t.references :airline, null: false, foreign_key: true
      t.references :plane, null: false, foreign_key: true
      
      t.timestamps
    end
  end
end
