class LessonhoursController < ApplicationController
  before_action :set_lessonhour, only: [:show, :edit, :update, :destroy]

  # GET /lessonhours
  # GET /lessonhours.json
  def index
    @lessonhours = Lessonhour.all
  end

  # GET /lessonhours/1
  # GET /lessonhours/1.json
  def show
  end

  # GET /lessonhours/new
  def new
    @lessonhour = Lessonhour.new
  end

  # GET /lessonhours/1/edit
  def edit
  end

  # POST /lessonhours
  # POST /lessonhours.json
  def create
    @lessonhour = Lessonhour.new(lessonhour_params)

    respond_to do |format|
      if @lessonhour.save
        format.html { redirect_to @lessonhour, notice: 'Lessonhour was successfully created.' }
        format.json { render :show, status: :created, location: @lessonhour }
      else
        format.html { render :new }
        format.json { render json: @lessonhour.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /lessonhours/1
  # PATCH/PUT /lessonhours/1.json
  def update
    respond_to do |format|
      if @lessonhour.update(lessonhour_params)
        format.html { redirect_to @lessonhour, notice: 'Lessonhour was successfully updated.' }
        format.json { render :show, status: :ok, location: @lessonhour }
      else
        format.html { render :edit }
        format.json { render json: @lessonhour.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /lessonhours/1
  # DELETE /lessonhours/1.json
  def destroy
    @lessonhour.destroy
    respond_to do |format|
      format.html { redirect_to lessonhours_url, notice: 'Lessonhour was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_lessonhour
      @lessonhour = Lessonhour.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def lessonhour_params
      params.require(:lessonhour).permit(:beginning, :ending)
    end
end
