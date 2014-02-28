class Admin::CorrectionsController < Admin::AdminController


  # GET /corrections
  def index
    @corrections = Correction.all.page params[:page]
  end


  # GET /corrections/new
  def new
    @correction = Correction.new
  end

  # GET /corrections/1/edit
  def edit
    @correction = Correction.find(params[:id])
    @place = @correction.place
  end


  # DELETE /corrections/1
  def destroy
    @correction = Correction.find(params[:id])
    @correction.destroy
    redirect_to admin_corrections_path, notice: 'Correction was successfully destroyed.'
  end

end
