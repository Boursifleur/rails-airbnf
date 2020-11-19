class PlanesController < ApplicationController
  def index
    skip_policy_scope
    if params[:query].present?
      sql_query = " \
        planes.name ILIKE :query \
        OR planes.location ILIKE :query \
        OR airlines.name ILIKE :query \
      "
      @planes = Plane.joins(:airline).where(sql_query, query: "%#{params[:query]}%")
    else
      @planes = Plane.all
    end
  end

  def show
    @booking = Booking.new
    @plane = Plane.find(params[:id])
    @booking.plane = @plane
    authorize @plane
  end

  def new
    @plane = Plane.new
    authorize @plane
  end

  def create
    @plane = Plane.new(plane_params)
    @plane.airline = current_airline
    authorize @plane
    if @plane.save
      redirect_to plane_path(@plane)
    else
      render :new
    end
  end

  def edit
    @plane = Plane.find(params[:id])
    authorize @plane
  end

  def update
    @plane = Plane.find(params[:id])
    @plane.update(plane_params)
    authorize @plane
    if @plane.save
      redirect_to plane_path(@plane)
    else
      render :edit
    end
  end

  def destroy
    @plane = Plane.find(params[:id])
    @plane.destroy
    authorize @plane
    redirect_to planes_path
  end

  private

  def plane_params
    params.require(:plane).permit(:name, :location, :capacity, :price_per_day, :photo)
  end
end
