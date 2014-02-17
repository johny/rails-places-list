class Admin::CitiesController < Admin::AdminController
  before_action :set_city, except: [:index, :new, :create]

  # GET /cities
  def index
    @cities = City.order(places_count: :desc).limit(10)
  end

  # GET /cities/1
  def show
  end

  # GET /cities/new
  def new
    @city = City.new
  end

  # GET /cities/1/edit
  def edit
  end

  # POST /cities
  def create
    @city = City.new(city_params)

    if @city.save
      redirect_to admin_cities_path, notice: 'City was successfully created.'
    else
      render action: 'new'
    end
  end

  # PATCH/PUT /cities/1
  def update
    if @city.update(city_params)
      redirect_to admin_cities_path, notice: 'City was successfully updated.'
    else
      render action: 'edit'
    end
  end


  # PATCH/PUT /cities/1/enable
  def enable
    if @city.enable!
      redirect_to admin_cities_path, notice: "City #{@city.name} was successfully enabled."
    else
      redirect_to admin_cities_path, error: "City #{@city.name} could not be enabled."
    end
  end

  # PATCH/PUT /cities/1/disable
  def disable
    if @city.disable!
      redirect_to admin_cities_path, notice: "City #{@city.name} was successfully disabled."
    else
      redirect_to admin_cities_path, error: "City #{@city.name} could not be disabled."
    end
  end

  # DELETE /cities/1
  def destroy
    @city.destroy
    redirect_to admin_cities_path, notice: 'City was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_city
      @city = City.friendly.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def city_params
      params.require(:city).permit(:name, :slug, :adjective, :workflow_state)
    end
end
