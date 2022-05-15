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
    park = Park.create(name: params[:name], open: params[:open], size: params[:size])
    redirect_to "/parks/"
  end
end
