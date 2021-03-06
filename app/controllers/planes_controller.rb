class PlanesController < ApplicationController
  def index
    @planes = Plane.all
    # @planes = policy_scope(Plane)
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

    #@planes = policy_scope(Plane)

    @markers = @planes.geocoded.map do |plane|
      {
        lat: plane.latitude,
        lng: plane.longitude,
        infoWindow: render_to_string(partial: "info_window", locals: { plane: plane }),
        image_url: helpers.asset_url('airplane.png'),
        plane_id: plane.id
      }
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
      redirect_to my_planes_path(@plane)
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
    redirect_to my_planes_path
  end

  def my_planes
    skip_authorization
    
    @planes = current_airline.planes.order(id: :desc)

    # @planes = policy_scope(Plane)
  end

  private

  def plane_params
    params.require(:plane).permit(:name, :location, :capacity, :price_per_day, :photo)
  end
end
