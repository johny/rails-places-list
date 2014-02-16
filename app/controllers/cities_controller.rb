class CitiesController < ApplicationController
  def index
    @cities = City.public
  end
end
