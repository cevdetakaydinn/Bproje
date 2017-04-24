class DepartmentlessonsController < ApplicationController
  before_action :set_departmentlesson, only: [:show, :edit, :update, :destroy]

  # GET /departmentlessons
  # GET /departmentlessons.json
  def index
    @departmentlessons = Departmentlesson.all
    if(params.has_key?(:department))
      @department=Department.find(params[:department])
      @departmentlicenses=@department.departmentlicenses
    end
  end

  # GET /departmentlessons/1
  # GET /departmentlessons/1.json
  def show
  end

  # GET /departmentlessons/new
  def new
    @departmentlesson = Departmentlesson.new
  end

  # GET /departmentlessons/1/edit
  def edit
  end

  # POST /departmentlessons
  # POST /departmentlessons.json
  def create
    @departmentlesson = Departmentlesson.new(departmentlesson_params)

    respond_to do |format|
      if @departmentlesson.save
        format.html { redirect_to @departmentlesson, notice: 'Department lesson was successfully created.' }
        format.json { render :show, status: :created, location: @departmentlesson }
      else
        format.html { render :new }
        format.json { render json: @departmentlesson.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /departmentlessons/1
  # PATCH/PUT /departmentlessons/1.json
  def update
    respond_to do |format|
      if @departmentlesson.update(departmentlesson_params)
        format.html { redirect_to @departmentlesson, notice: 'Department lesson was successfully updated.' }
        format.json { render :show, status: :ok, location: @departmentlesson }
      else
        format.html { render :edit }
        format.json { render json: @departmentlesson.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /departmentlessons/1
  # DELETE /departmentlessons/1.json
  def destroy
    @departmentlesson.destroy
    respond_to do |format|
      format.html { redirect_to departmentlessons_url, notice: 'Department lesson was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_departmentlesson
      @departmentlesson = Departmentlesson.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def departmentlesson_params
      params.require(:departmentlesson).permit(:departmentlicense_id, :hour_amount, :lesson_id,:grade)
    end
end
