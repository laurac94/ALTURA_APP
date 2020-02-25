class PlanesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
  @planes = Plane.all
  end

  def show
    @plane = Plane.find(params[:id])
  end

  def new
    @plane = Plane.new
  end

  def create
    @plane = Plane.new(plane_params)
    @plane.user = current_user
    if @plane.save
      redirect_to plane_path(@plane)
    else
      render :new
    end

  end

  private

  def plane_params
    params.require(:plane).permit(:capacity, :location, :type, :rate, :description, :pilot_name, :photo)
  end



end
