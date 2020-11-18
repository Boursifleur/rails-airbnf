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

  def new
    @plane = Plane.find(params[:plane_id])
    @booking = Booking.new
    authorize @booking
  end

  def create
    @plane = Plane.find(params[:plane_id])
    @booking = Booking.new(booking_params)
    authorize @booking
    @booking.plane = @plane
    @booking.airline = current_airline

    if @booking.save
      redirect_to bookings_path
    else
      render :new
    end
  end

  private

  def booking_params
    params.require(:booking).permit(:status, :start_date, :end_date)
  end
end
