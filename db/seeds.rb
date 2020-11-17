require 'faker'

p "cleaning all"

Airline.destroy_all
Plane.destroy_all
Booking.destroy_all

p "starting Airline seed"

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


p "starting Airline seed"

15.times do
Plane.create!(
  name: "#{Faker::Superhero.name}",
  location: "#{Faker::Address.city}",
  capacity: rand(100..500),
  price_per_day: rand(2000..50000),
  airline_id: jeromeairline.id
  )
end


7.times do
Plane.create!(
  name: "#{Faker::Superhero.name}",
  location: "#{Faker::Address.city}",
  capacity: rand(100..500),
  price_per_day: rand(2000..50000),
  airline_id: thierryairline.id
  )
end

p "finishing seed"
