class TrailsController < ApplicationController
  def index
    @trails = Trail.only_true
  end

  def show
    @trail = Trail.find(params[:id])
  end

  def edit
    @trail = Trail.find(params[:id])
  end

  def update
    @trail = Trail.find(params[:id])
    @trail.update(trail_params)
    redirect_to "/trails/#{@trail.id}"
  end

  def destroy
    trail = Trail.find(params[:id])
    trail.destroy
    redirect_to "/trails"
  end

  private
  def trail_params
    params.permit(:name, :hikable, :length)
  end
end
