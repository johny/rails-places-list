class Admin::PlacesController < Admin::AdminController
  before_action :set_place, only: [:show, :edit, :update, :destroy]

  # GET /places
  def index
    @places = Place.all.page params[:page]
  end

  # GET /places/1
  def show
  end

  # GET /places/new
  def new
    @place = Place.new
  end

  # GET /places/1/edit
  def edit
  end

  # POST /places
  def create
    @place = Place.new(place_params)

    if @place.save
      redirect_to admin_places_path, notice: 'Place was successfully created.'
    else
      render action: 'new'
    end
  end

  # PATCH/PUT /places/1
  def update
    if @place.update(place_params)
      flash[:notice] = 'Place was successfully updated.'
      if params[:commit].match(/next/)
        next_place = Place.find(@place.id + 1)
        redirect_to edit_admin_place_path(next_place)
      else
        redirect_to admin_places_path
      end
    else
      render action: 'edit'
    end
  end

  # DELETE /places/1
  def destroy
    @place.destroy
    redirect_to admin_places_path, notice: 'Place was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_place
      @place = Place.friendly.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def place_params
      params.require(:place).permit(:name, :slug, :description, :street_address, :zipcode, :city_id, :phone, :website, :email, :workflow_state)
    end
end
