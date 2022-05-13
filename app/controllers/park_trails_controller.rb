class ParkTrailsController < ApplicationController
  def index
    @park = Park.find(params[:id])
    @trails = @park.trails
  end
end
