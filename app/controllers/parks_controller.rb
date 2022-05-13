class ParksController < ApplicationController
  def index
    @parks = Park.ordered
  end

  def show
    @park = Park.find(params[:id])
  end
end
