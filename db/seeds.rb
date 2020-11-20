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

jeromeairline = Airline.create!(
  name: "Jeje-airline",
  email: "jerome@gmail.com",
  password: "password"
  )

thierryairline = Airline.create!(
  name: "Titi-airline",
  email: "thierry@gmail.com",
  password: "password"
  )

floairline = Airline.create!(
  name: "Flo-airline",
  email: "florian@gmail.com",
  password: "password"
  )

# url = URI("https://iata-and-icao-codes.p.rapidapi.com/airlines")

# http = Net::HTTP.new(url.host, url.port)
# http.use_ssl = true
# http.verify_mode = OpenSSL::SSL::VERIFY_NONE

# request = Net::HTTP::Get.new(url)
# request["x-rapidapi-key"] = '67626310e2msh9ca788f9686d968p19677ajsnfe06d65490f1'
# request["x-rapidapi-host"] = 'iata-and-icao-codes.p.rapidapi.com'

# airlines = http.request(request)
# airlines = JSON.parse(airlines.read_body)
# airlines.each do |airline|
#   Airline.create(name: airline['name'], email: "#{airline['iata_code']}@airline.com", password: "password")
# end

p "*** Starting planes seed ***"


# params = {
#   :access_key => AVIATIONSTACK_API_KEY.to_s
# }
# uri = URI('https://api.aviationstack.com/v1/airplanes')
# uri.query = URI.encode_www_form(params)
# json = Net::HTTP.get(uri)
# api_response = JSON.parse(json)
# p api_response['results']

# for flight in api_response['results']
#     unless flight['live']['is_ground']
#         puts sprintf("%s flight %s from %s (%s) to %s (%s) is in the air.",
#             flight['airline']['name'],
#             flight['flight']['iata'],
#             flight['departure']['airport'],
#             flight['departure']['iata'],
#             flight['arrival']['airport'],
#             flight['arrival']['iata']
#         )
#     end
# end

8.times do
Plane.create(
  name: "#{Faker::Superhero.name}",
  location: "#{Faker::Address.city}",
  capacity: rand(100..500),
  price_per_day: rand(2000..50000),
  airline_id: jeromeairline.id
  )
end


8.times do
Plane.create(
  name: "#{Faker::Superhero.name}",
  location: "#{Faker::Address.city}",
  capacity: rand(100..500),
  price_per_day: rand(2000..50000),
  airline_id: thierryairline.id
  )
end

8.times do
Plane.create(
  name: "#{Faker::Superhero.name}",
  location: "#{Faker::Address.city}",
  capacity: rand(100..500),
  price_per_day: rand(2000..50000),
  airline_id: floairline.id
  )
end

## ici les start et end time ont un format DateTime.striptime pour générer le rendu que l'on souhaite
p "*** Starting bookings seed ***"

Booking.create(
  start_date: DateTime.new(2020,12,1,17,0,0),
  end_date: DateTime.new(2020,12,8,17,0,0),
  airline_id: floairline.id,
  plane_id: Plane.where.not(airline:floairline).pluck(:id).sample
  ##recupere tous les avions existants sauf ceux de floairline car c'est ,
  ##ça prend seulement les ID (pluck) et ça random un des avions.
  )

Booking.create(
  start_date: DateTime.new(2020,12,9,17,0,0),
  end_date: DateTime.new(2020,12,12,17,0,0),
  airline_id: floairline.id,
  plane_id: Plane.where.not(airline:floairline).pluck(:id).sample
  #recupere tous les avions existants sauf ceux de floairline car c'est celui qui demande le booking,
  ##ça prend seulement les ID et ça random un des avions.
  )

Booking.create(
  start_date: DateTime.new(2020,12,20,17,0,0),
  end_date: DateTime.new(2020,12,22,17,0,0),
  airline_id: thierryairline.id,
  plane_id: Plane.where.not(airline:thierryairline).pluck(:id).sample
  )

Booking.create(
  start_date: DateTime.new(2020,12,20,17,0,0),
  end_date: DateTime.new(2020,12,22,17,0,0),
  airline_id: thierryairline.id,
  plane_id: Plane.where.not(airline:thierryairline).pluck(:id).sample
  )


Booking.create(
  start_date: DateTime.new(2020,12,20,17,0,0),
  end_date: DateTime.new(2020,12,22,17,0,0),
  airline_id: thierryairline.id,
  plane_id: Plane.where.not(airline:thierryairline).pluck(:id).sample
  )

Booking.create(
  start_date: DateTime.new(2020,12,20,17,0,0),
  end_date: DateTime.new(2020,12,22,17,0,0),
  airline_id: thierryairline.id,
  plane_id: Plane.where.not(airline:thierryairline).pluck(:id).sample
  )

Booking.create(
  start_date: DateTime.new(2020,12,20,17,0,0),
  end_date: DateTime.new(2020,12,22,17,0,0),
  airline_id: jeromeairline.id,
  plane_id: Plane.where.not(airline:jeromeairline.id).pluck(:id).sample
  )

Booking.create(
  start_date: DateTime.new(2020,12,20,17,0,0),
  end_date: DateTime.new(2020,12,22,17,0,0),
  airline_id: jeromeairline.id,
  plane_id: Plane.where.not(airline:jeromeairline.id).pluck(:id).sample
  )

Booking.create(
  start_date: DateTime.new(2020,12,20,17,0,0),
  end_date: DateTime.new(2020,12,22,17,0,0),
  airline_id: jeromeairline.id,
  plane_id: Plane.where.not(airline:jeromeairline.id).pluck(:id).sample
  )

p "finishing seed, j'adore les shorts"
