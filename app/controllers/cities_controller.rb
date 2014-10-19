class CitiesController < ApplicationController
  def index
    @cities = City.displayed
  end
end
