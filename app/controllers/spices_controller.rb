class SpicesController < ApplicationController

  

  def index
    render json: Spice.all
  end

  def show
    spice = find_spice
    render json: spice
    rescue
      render_not_found_response
  end

  def create
    spice = Spice.create(spice_params)
    render json: spice
  end

  def update
    spice = find_spice
    spice.update(spice_params)
    render json: spice
  rescue
    render_not_found_response
  end

  def destroy
    spice = find_spice
    spice.destroy
    head :no_content
  rescue
    render_not_found_response
  end

  private

  def spice_params
    params.permit(:title, :image, :description, :notes, :rating)
  end

  def find_spice
    Spice.find(params[:id])
  end

  def render_not_found_response
    render json: {error:"Spice not found"}, status: :not_found
  end

end
