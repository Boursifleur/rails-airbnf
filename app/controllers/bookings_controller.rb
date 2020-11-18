class BookingsController < ApplicationController
  def index
    skip_policy_scope

    @bookings_as_renter = current_airline.bookings
    # all the bookings that the current airline made

    @planes = current_airline.planes
    # all the plane of the current airline online

    @bookings_as_owner = Booking.where(plane: @planes)
    # all the bookings request for the current airline planes
  end
end
