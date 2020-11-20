class RemoveFromAirlines < ActiveRecord::Migration[6.0]
  def change
    remove_column :airlines, :type
  end
end
