class PlanesController < ApplicationController

  def index
    # @planes = Plane.all
    @planes = policy_scope(Plane)
  end

  def show
    @booking = Booking.new
    @plane = Plane.find(params[:id])
    authorize @plane
    # skip_authorization
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
    params.require(:plane).permit(:name, :location, :capacity, :price_per_day)
  end
end
