class AddDetailsToAirlines < ActiveRecord::Migration[6.0]
  def change
    add_column :airlines, :fleet_average_age, :string
    add_column :airlines, :callsign, :string
    add_column :airlines, :hub_code, :string
    add_column :airlines, :iata_code, :string
    add_column :airlines, :icao_code, :string
    add_column :airlines, :country_iso2, :string
    add_column :airlines, :date_founded, :string
    add_column :airlines, :iata_prefix_accounting, :string
    add_column :airlines, :country_name, :string
    add_column :airlines, :fleet_size, :string
    add_column :airlines, :status, :string
    add_column :airlines, :type, :string
  end
end
