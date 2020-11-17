class PlanesController < ApplicationController

  def index
    @planes = Plane.all
  end

  def new
    @plane = Plane.new
    authorize @plane
  end

  def create
    @plane = Plane.new(plane_params)
    @plane.airline = current_airline
    if @plane.save
      redirect_to plane_path(@plane)
    else 
      render :new
    end
  end
  
  private

  def plane_params
    params.require(:plane).permit(:type, :location, :capacity, :price_per_day)
  end
end
