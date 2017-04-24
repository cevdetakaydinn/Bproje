class WeeklyschedulesController < ApplicationController
  before_action :set_weeklyschedule, only: [:show, :edit, :update, :destroy]

  # GET /weeklyschedules
  # GET /weeklyschedules.json
  def index
    @weeklyschedules = Weeklyschedule.all
  end

  # GET /weeklyschedules/1
  # GET /weeklyschedules/1.json
  def show
  end

  # GET /weeklyschedules/new
  def new
    @weeklyschedule = Weeklyschedule.new
  end

  # GET /weeklyschedules/1/edit
  def edit
  end
  def listSchedules
  end
  # POST /weeklyschedules
  # POST /weeklyschedules.json
  def create
    @weeklyschedule = Weeklyschedule.new(weeklyschedule_params)

    respond_to do |format|
      if @weeklyschedule.save
        format.html { redirect_to @weeklyschedule, notice: 'Weeklyschedule was successfully created.' }
        format.json { render :show, status: :created, location: @weeklyschedule }
      else
        format.html { render :new }
        format.json { render json: @weeklyschedule.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /weeklyschedules/1
  # PATCH/PUT /weeklyschedules/1.json
  def update
    respond_to do |format|
      if @weeklyschedule.update(weeklyschedule_params)
        format.html { redirect_to @weeklyschedule, notice: 'Weeklyschedule was successfully updated.' }
        format.json { render :show, status: :ok, location: @weeklyschedule }
      else
        format.html { render :edit }
        format.json { render json: @weeklyschedule.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /weeklyschedules/1
  # DELETE /weeklyschedules/1.json
  def destroy
    @weeklyschedule.destroy
    respond_to do |format|
      format.html { redirect_to weeklyschedules_url, notice: 'Weeklyschedule was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_weeklyschedule
      @weeklyschedule = Weeklyschedule.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def weeklyschedule_params
      params.require(:weeklyschedule).permit(:lessonhours_id, :day_id, :curriculum_id, :classroom_id)
    end
end
