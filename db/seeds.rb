require 'uri'
require 'json'
require 'net/http'
require 'openssl'
require 'faker'
require 'net/http'


p "*** Cleaning all ***"

Booking.destroy_all
Plane.destroy_all
Airline.destroy_all


p "*** Starting airline seed ***"

params = {
  :access_key => ENV['AVIATIONSTACK_API_KEY']
}
uri = URI('http://api.aviationstack.com/v1/airlines')
uri.query = URI.encode_www_form(params)
json = Net::HTTP.get(uri)
api_response = JSON.parse(json)

api_response["data"].each do |airline|
  new_airline = Airline.new
  new_airline[:fleet_average_age] = airline["fleet_average_age"]
  new_airline[:callsign] = airline["callsign"]
  new_airline[:hub_code] = airline["hub_code"]
  new_airline[:iata_code] = airline["iata_code"]
  new_airline[:icao_code] = airline["icao_code"]
  new_airline[:country_iso2] = airline["country_iso2"]
  new_airline[:date_founded] = airline["date_founded"]
  new_airline[:iata_prefix_accounting] = airline["iata_prefix_accounting"]
  new_airline[:country_name] = airline["country_name"]
  new_airline[:fleet_size] = airline["fleet_size"]
  new_airline[:status] = airline["status"]
  new_airline[:name] = airline["airline_name"]
  new_airline[:email] = "#{airline['callsign']}@airline.com"
  new_airline.password = "password"
  new_airline.save
 end

p "*** Starting aiports seed ***"
params = {
  :access_key => ENV['AVIATIONSTACK_API_KEY']
}
uri = URI('http://api.aviationstack.com/v1/airports')
uri.query = URI.encode_www_form(params)
json = Net::HTTP.get(uri)
api_response = JSON.parse(json)
airports = api_response["data"]
locations = []
airports.each do |airport|
  locations << airport["airport_name"]
end


p "*** Starting planes seed ***"

params = {
  :access_key => ENV['AVIATIONSTACK_API_KEY']
}
uri = URI('http://api.aviationstack.com/v1/airplanes')
uri.query = URI.encode_www_form(params)
json = Net::HTTP.get(uri)
api_response = JSON.parse(json)

api_response["data"].each do |plane|
  new_plane = Plane.new
  new_plane[:name] = plane["iata_type"]
  new_plane[:location] = locations[rand(0..locations.length-1)]
  new_plane[:capacity] = rand(100..500)
  new_plane[:price_per_day] = rand(2000..50000)
  new_plane[:plane_age] = plane["plane_age"]
  new_plane[:production_line] = plane["production_line"]
  airline = Airline.where(iata_code: plane["airline_iata_code"])[0]
    if airline.blank?
      airline = Airline.first
    end
  new_plane.airline = airline

  file = URI.open("https://source.unsplash.com/500x400/?airbus")
  filename = new_plane.name
  new_plane.photo.attach(io: file, filename: "#{filename}", content_type: 'image/jpg')

  new_plane.save
 end


## ici les start et end time ont un format DateTime.striptime pour générer le rendu que l'on souhaite
p "*** Starting bookings seed ***"

american_airline = Airline.where(email: "american@airline.com")[0]
50.times do
  start_year = rand(2017..2023)
  start_month = rand(1..12)
  start_day = rand (1..15)
  duration = rand(1..10)
  end_day = start_day + duration
  start_hour = rand(0..23)
  end_hour = rand(0..23)

  booking = Booking.new(
  start_date: DateTime.new(start_year,start_month,start_day,start_hour,0,0),
  end_date: DateTime.new(start_year,start_month,end_day,end_hour,0,0),
  airline_id: american_airline.id,
  )
  # random = rand(1..500)
  booked_plane = Plane.where("").sample
  booking.plane = booked_plane
  booking.save
end

# Booking.create(
#   start_date: DateTime.new(2020,12,1,17,0,0),
#   end_date: DateTime.new(2020,12,8,17,0,0),
#   airline_id: floairline.id,
#   plane_id: Plane.where.not(airline:floairline).pluck(:id).sample
#   ##recupere tous les avions existants sauf ceux de floairline car c'est ,
#   ##ça prend seulement les ID (pluck) et ça random un des avions.
#   )

# Booking.create(
#   start_date: DateTime.new(2020,12,9,17,0,0),
#   end_date: DateTime.new(2020,12,12,17,0,0),
#   airline_id: floairline.id,
#   plane_id: Plane.where.not(airline:floairline).pluck(:id).sample
#   #recupere tous les avions existants sauf ceux de floairline car c'est celui qui demande le booking,
#   ##ça prend seulement les ID et ça random un des avions.
#   )

# Booking.create(
#   start_date: DateTime.new(2020,12,20,17,0,0),
#   end_date: DateTime.new(2020,12,22,17,0,0),
#   airline_id: thierryairline.id,
#   plane_id: Plane.where.not(airline:thierryairline).pluck(:id).sample
#   )

# Booking.create(
#   start_date: DateTime.new(2020,12,20,17,0,0),
#   end_date: DateTime.new(2020,12,22,17,0,0),
#   airline_id: thierryairline.id,
#   plane_id: Plane.where.not(airline:thierryairline).pluck(:id).sample
#   )


# Booking.create(
#   start_date: DateTime.new(2020,12,20,17,0,0),
#   end_date: DateTime.new(2020,12,22,17,0,0),
#   airline_id: thierryairline.id,
#   plane_id: Plane.where.not(airline:thierryairline).pluck(:id).sample
#   )

# Booking.create(
#   start_date: DateTime.new(2020,12,20,17,0,0),
#   end_date: DateTime.new(2020,12,22,17,0,0),
#   airline_id: thierryairline.id,
#   plane_id: Plane.where.not(airline:thierryairline).pluck(:id).sample
#   )

# Booking.create(
#   start_date: DateTime.new(2020,12,20,17,0,0),
#   end_date: DateTime.new(2020,12,22,17,0,0),
#   airline_id: jeromeairline.id,
#   plane_id: Plane.where.not(airline:jeromeairline.id).pluck(:id).sample
#   )

# Booking.create(
#   start_date: DateTime.new(2020,12,20,17,0,0),
#   end_date: DateTime.new(2020,12,22,17,0,0),
#   airline_id: jeromeairline.id,
#   plane_id: Plane.where.not(airline:jeromeairline.id).pluck(:id).sample
#   )

# Booking.create(
#   start_date: DateTime.new(2020,12,20,17,0,0),
#   end_date: DateTime.new(2020,12,22,17,0,0),
#   airline_id: jeromeairline.id,
#   plane_id: Plane.where.not(airline:jeromeairline.id).pluck(:id).sample
#   )

p "finishing seed, j'adore les shorts"
