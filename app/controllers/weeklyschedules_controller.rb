class WeeklyschedulesController < ApplicationController
  before_action :set_weeklyschedule, only: [:show, :edit, :update, :destroy]

  # GET /weeklyschedules
  # GET /weeklyschedules.json
  def index
    @weeklyschedules = Weeklyschedule.all
    #dumy array
    @array=Array.new(7) { Array.new(5) }
    @array = [
      ["fizik","fizik","fizik","","Matematik","Matematik","kimya"],
      ["","","","","Programlamaya Giriş","Programlamaya Giriş","Programlamaya Giriş"],
      ["","","","","","",""],
      ["","","","","","",""],
      ["","","","","","",""]
    ]
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
    @weeklySch=Array.new

    @curriculum.each do |cur|
        @weeklySch<<Weeklyschedule.where(curriculum_id: cur)
    end
    @array=Array.new(Lessonhour.all.size+1) { |k| Array.new(Day.all.size) { |k| "" }}
    @weeklySch.each do |x|
      x.each do |y|
        @array[y[:lessonhours_id]][y[:day_id]]=y

      end
    end
    @array.each_with_index.map do |_, index|
      @array.map { |row| row[index] }
    end
    render :json => @array
  end

  def generateSchedule
    #Libdeki populasyon sınıfını kullanarak oluşturma işini yapıcak
  end

  def saveSchedule
    #oluşturlan en iyi ders programını veritabanına kaydedicek
  end

  def getSchedule
    #gerekli bilgileri alıp (department,academicterm) view de göstermek için gönderecek
    #dummy for now
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
