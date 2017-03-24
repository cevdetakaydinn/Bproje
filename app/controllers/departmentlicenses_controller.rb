class DepartmentlicensesController < ApplicationController
  before_action :set_departmentlicense, only: [:show, :edit, :update, :destroy]

  # GET /departmentlicenses
  # GET /departmentlicenses.json
  def index
    @departmentlicenses = Departmentlicense.all
  end

  # GET /departmentlicenses/1
  # GET /departmentlicenses/1.json
  def show
  end

  # GET /departmentlicenses/new
  def new
    @departmentlicense = Departmentlicense.new
  end

  # GET /departmentlicenses/1/edit
  def edit
  end

  # POST /departmentlicenses
  # POST /departmentlicenses.json
  def create
    @departmentlicense = Departmentlicense.new(departmentlicense_params)

    respond_to do |format|
      if @departmentlicense.save
        format.html { redirect_to @departmentlicense, notice: 'Departmentlicense was successfully created.' }
        format.json { render :show, status: :created, location: @departmentlicense }
      else
        format.html { render :new }
        format.json { render json: @departmentlicense.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /departmentlicenses/1
  # PATCH/PUT /departmentlicenses/1.json
  def update
    respond_to do |format|
      if @departmentlicense.update(departmentlicense_params)
        format.html { redirect_to @departmentlicense, notice: 'Departmentlicense was successfully updated.' }
        format.json { render :show, status: :ok, location: @departmentlicense }
      else
        format.html { render :edit }
        format.json { render json: @departmentlicense.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /departmentlicenses/1
  # DELETE /departmentlicenses/1.json
  def destroy
    @departmentlicense.destroy
    respond_to do |format|
      format.html { redirect_to departmentlicenses_url, notice: 'Departmentlicense was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_departmentlicense
      @departmentlicense = Departmentlicense.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def departmentlicense_params
      params.require(:departmentlicense).permit(:year, :has_night, :department_id, :license_id)
    end
end
