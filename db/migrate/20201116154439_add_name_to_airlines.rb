class AddNameToAirlines < ActiveRecord::Migration[6.0]
  def change
    add_column :airlines, :name, :string
  end
end
