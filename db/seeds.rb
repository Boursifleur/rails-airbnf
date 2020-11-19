require 'faker'

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


p "*** Starting planes seed ***"

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
