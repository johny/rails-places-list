class CorrectionsController < ApplicationController

  def new
    @place = Place.friendly.find(params[:place_id])
    @correction = Correction.new
  end

  def create

    @place = Place.friendly.find(params[:place_id])

    @correction = Correction.new(correction_params)
    @correction.place = @place

    if @correction.save
      redirect_to city_place_path(@place.city, @place), notice: 'Twoja poprawka została zgłoszona. Dziękujemy!'
    else
      render action: 'new'
    end
  end

  private

    # Only allow a trusted parameter "white list" through.
    def correction_params
      params.require(:correction).permit(:description, :comments, :email, :website, :phone)
    end

end
