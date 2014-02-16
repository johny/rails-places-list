class PlacesController < ApplicationController

  def index
    @city = City.friendly.find(params[:city_id])
    @places = @city.places.page params[:page]
  end

  def show
    @city = City.friendly.find(params[:city_id])
    @place = Place.friendly.find(params[:id])
  end

end
