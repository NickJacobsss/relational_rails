class ParksController < ApplicationController
  def index
    @parks = Park.ordered
  end

  def show
    @park = Park.find(params[:id])
  end

  def new
  end

  def create
    park = Park.create(park_params)
    redirect_to "/parks/"
  end

  def edit
    @park = Park.find(params[:id])
  end

  def update
    @park = Park.find(params[:id])
    @park.update(park_params)
    redirect_to "/parks/#{@park.id}"
  end

private
  def park_params
    params.permit(:name, :open, :size)
  end
end
