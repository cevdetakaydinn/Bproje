class WeeklyschedulesController < ApplicationController
  before_action :set_weeklyschedule, only: [:show, :edit, :update, :destroy]

  # GET /weeklyschedules
  # GET /weeklyschedules.json
  def index

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

  def listFacilities
    @facilities=Facility.where(university_id: params[:university_id])
    render :json => @facilities
  end

  def listDepartments
    @departments=Department.where(facility_id: params[:facility_id])
    render :json => @departments
  end

  def listSchedules
    @department=Department.where(id: params[:anything][:department]).limit(1)
    @academicterm=Academicterm.where(id: params[:anything][:academicterm]).limit(1)
    @license=License.where(id: params[:anything][:license]).limit(1)
    @departmentlicense=Departmentlicense.where(department_id: @department, license_id: @license).limit(1)
    @departmentlessons=Departmentlesson.where(departmentlicense_id: @departmentlicense)
    @curriculum=Array.new
    @departmentlessons.each do |dLesson|
      @curriculum.append(Curriculum.where(departmentlesson_id: dLesson ,academicterm: @academicterm))
    end
    #Ders programı gosterme
    if params[:show]
      @weeklySch=Array.new
      @curriculum.each do |cur|
        Weeklyschedule.where(curriculum_id: cur).each do |wcs|
          @weeklySch<<wcs
        end
      end
      @array=Array.new(Day.all.size) { |k| Array.new(Lessonhour.all.size) { |k| "" }}
      @weeklySch.sort_by!{|e| e.day_id}
      @weeklySch.each do |x|
          @array[x[:day_id]-1][x[:lessonhours_id]-1]=x.curriculum.departmentlesson.lesson.name
      end
    else
      generatePopulation(@curriculum)
      render :json =>@population.calcFitness
      # @population.naturalSelection()
      # @population.generate()#crossover
      # @population.evaluate();
    end

  end
  #Ders programı Uretme
  def generatePopulation(curriculum)
    #Mufredatı kullanarak random population olustur
    @population = Population.new(1,2,curriculum)
    @array =  @population.getpop(0)
    # render :json => @population
  end

  def saveSchedule
    #oluşturlan en iyi ders programını veritabanına kaydedicek
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
