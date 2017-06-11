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
  def addClassrooms
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
      @showHash=Hash.new
      @grade = Hash.new
      t=0
      while t<6
        @grade[t] = Array.new
        @showHash[t]=Array.new(Day.all.size) { |k| Array.new(Lessonhour.all.size) { |k| "" }}
        t += 1
      end

      @weeklySch.each do |x|
        currentGrade = x.curriculum.departmentlesson.grade
        case currentGrade
        when 1
          @grade[0]<<x
        when 2
          @grade[1]<<x
        when 3
          @grade[2]<<x
        when 4
          @grade[3]<<x
        when 5
          @grade[4]<<x
        when 6
          @grade[5]<<x
        when 7
          @grade[6]<<x
        end
      end
      k=0
      while k<Departmentlesson.maximum(:grade)
        @grade[k].sort_by!{|e| e.day_id}
        k=k+1
      end
      asd=Array.new
       k=0
       while k<Departmentlesson.maximum(:grade)
         @grade[k].each do |grd|
           unless grd.blank?
             @showHash[k][grd.day_id-1][grd.lessonhour_id-1]=grd.curriculum.departmentlesson.lesson.name
             asd<<k
           end
         end
         k=k+1
       end
      #  render :json =>@showHash
      # @array[x[:day_id]-1][x[:lessonhour_id]-1]=x.curriculum.departmentlesson.lesson.name

    #Girilen ders programını siler
    elsif params[:delete]
      @curriculum.each do |cur|
        Weeklyschedule.where(:curriculum_id=>cur.first.id).each do |ws|
          ws.destroy
        end
      end
      respond_to do |format|
        format.html { redirect_to weeklyschedules_url, notice: 'Weeklyschedule was successfully deleted.' }
        format.json { head :no_content }
      end
    #Ders çizelgesi üret
    else

      generatePopulation(@curriculum)
      respond_to do |format|
        format.html { redirect_to weeklyschedules_url, notice: 'Weeklyschedule was successfully created.' }
        format.json { head :no_content }
      end

    end

  end
  #Ders programı Uretme
  def generatePopulation(curriculum)
    @popHash = Hash.new
    @cur = Hash.new
    @cur[0] = Array.new
    @cur[1] = Array.new
    @cur[2] = Array.new
    @cur[3] = Array.new
    @cur[4] = Array.new
    @cur[5] = Array.new
    @cur[6] = Array.new
    curriculum.each do |cr|
      currentCrGrade = cr.first.departmentlesson.grade
      case currentCrGrade
      when 1
        @cur[0]<<cr
      when 2
        @cur[1]<<cr
      when 3
        @cur[2]<<cr
      when 4
        @cur[3]<<cr
      when 5
        @cur[4]<<cr
      when 6
        @cur[5]<<cr
      when 7
        @cur[6]<<cr
      end
    end
    @highestGrade=Departmentlesson.maximum(:grade)
    #highest gradei kullanıp hash {grade:population} olustur
    #Mufredatı kullanarak random population olustur
    i=0
    allday=Day.all.size
    allhour=Lessonhour.all.size
    while i<@highestGrade
      @popHash[i] = Population.new(0.01,100,@cur[i],allday,allhour)
      # @popHash[i].calcFitness
      # @popHash[0].naturalSelection
      z=0
      while z<300
        @popHash[i].calcFitness
        @popHash[i].naturalSelection
        @popHash[i].reproduction
        z += 1
      end
      i=i+1
    end

    t=0
    while t<@highestGrade
      @popHash[t].population[0].genes.each_with_index do |gen,day|
        gen.each_with_index do |modul,hour|
          unless modul.blank?
            @weeklyschedule = Weeklyschedule.new(:lessonhour_id => hour+1,:day_id => day+1,:curriculum_id=> modul,:classroom_id=>1)
            @weeklyschedule.save
          end
        end
      end
      t=t+1
    end
    # render :json =>@popHash
    return @popHash
  end

  def deleteSchedule(sch)
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
      params.require(:weeklyschedule).permit(:lessonhour_id, :day_id, :curriculum_id, :classroom_id)
    end
end
