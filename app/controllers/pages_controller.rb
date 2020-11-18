class PagesController < ApplicationController
  skip_before_action :authenticate_airline!, only: :home

  def home
    @planes = Plane.all
  end
end
