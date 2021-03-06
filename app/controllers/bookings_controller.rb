class BookingsController < ApplicationController
  def index
    skip_policy_scope

    @bookings_as_renter = current_airline.bookings.order(start_date: :asc)
    # all the bookings that the current airline made

    @planes = current_airline.planes
    # all the plane of the current airline online

    @bookings_as_owner = Booking.where(plane: @planes)

    @current_bookings = @bookings_as_owner.where(status: "accepted").where("DATE(end_date) >= ?", Date.today).order(end_date: :asc)

    @current_bookings_present = @current_bookings.where("DATE(start_date) <= ?", Date.today).order(start_date: :desc)

    @current_bookings_futur = @current_bookings.where("DATE(start_date) > ?", Date.today).order(start_date: :desc)

    @old_bookings = @bookings_as_owner.where.not(status: "pending").where("DATE(end_date) < ?", Date.today).order(end_date: :desc)

    # all the bookings request for the current airline planes
  end

  def new
    @plane = Plane.find(params[:plane_id])
    @booking = Booking.new
    @booking.plane = @plane
    authorize @booking
  end

  def create
    @plane = Plane.find(params[:plane_id])
    @booking = Booking.new(booking_params)
    authorize @booking
    @booking.plane = @plane
    @booking.airline = current_airline

    if @booking.save
      redirect_to bookings_path, notice: "Booking request done"
    else
      render :new
    end
  end

  def edit
    @booking = Booking.find(params[:id])
    authorize @booking
  end

  def update
    @booking = Booking.find(params[:id])
    authorize @booking
    @booking.update(booking_params)
    redirect_to bookings_path
  end

  def accepted
    @booking = Booking.find(params[:id])
    authorize @booking

    @booking.update(status: "accepted")
    redirect_to bookings_path(tabactive: true)
  end

  def refused
    @booking = Booking.find(params[:id])
    authorize @booking

    @booking.update(status: "refused")
     redirect_to bookings_path(tabactive: true)
  end

  private

  def booking_params
    params.require(:booking).permit(:status, :start_date, :end_date)
  end
end
