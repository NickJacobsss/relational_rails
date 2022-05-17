class ParkTrailsController < ApplicationController
  def index
    @park = Park.find(params[:id])
    @trail = Trail.all
    @trails = @park.trails
  end

  def new
    @park = Park.find(params[:id])
  end

  def create
    @park = Park.find(params[:id])
    new_trail = @park.trails.create(park_trail_params)
    redirect_to "/parks/#{@park.id}/trails"
  end

  private
  def park_trail_params
    params.permit(:name, :hikable, :length)
  end
end
