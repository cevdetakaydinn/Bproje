class AcademictermsController < ApplicationController
  before_action :set_academicterm, only: [:show, :edit, :update, :destroy]

  # GET /academicterms
  # GET /academicterms.json
  def index
    @academicterms = Academicterm.all
  end

  # GET /academicterms/1
  # GET /academicterms/1.json
  def show
  end

  # GET /academicterms/new
  def new
    @academicterm = Academicterm.new
  end

  # GET /academicterms/1/edit
  def edit
  end

  # POST /academicterms
  # POST /academicterms.json
  def create
    @academicterm = Academicterm.new(academicterm_params)

    respond_to do |format|
      if @academicterm.save
        format.html { redirect_to @academicterm, notice: 'Academicterm was successfully created.' }
        format.json { render :show, status: :created, location: @academicterm }
      else
        format.html { render :new }
        format.json { render json: @academicterm.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /academicterms/1
  # PATCH/PUT /academicterms/1.json
  def update
    respond_to do |format|
      if @academicterm.update(academicterm_params)
        format.html { redirect_to @academicterm, notice: 'Academicterm was successfully updated.' }
        format.json { render :show, status: :ok, location: @academicterm }
      else
        format.html { render :edit }
        format.json { render json: @academicterm.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /academicterms/1
  # DELETE /academicterms/1.json
  def destroy
    @academicterm.destroy
    respond_to do |format|
      format.html { redirect_to academicterms_url, notice: 'Academicterm was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_academicterm
      @academicterm = Academicterm.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def academicterm_params
      params.require(:academicterm).permit(:term, :year)
    end
end
