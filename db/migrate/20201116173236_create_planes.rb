class CreatePlanes < ActiveRecord::Migration[6.0]
  def change
    create_table :planes do |t|
      t.string :type
      t.string :location
      t.integer :capacity
      t.integer :price_per_day
      t.references :airline, null: false, foreign_key: true

      t.timestamps
    end
  end
end
