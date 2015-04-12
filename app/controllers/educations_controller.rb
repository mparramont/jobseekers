class EducationsController < ApplicationController
  before_action :set_education, only: [:edit, :update, :destroy]

  # GET /educations/new
  def new
    @education = Education.new
  end

  # GET /educations/1/edit
  def edit
  end

  # POST /educations
  # POST /educations.json
  def create
    @education = Education.new(education_params.merge!(user: current_user))

    respond_to do |format|
      if @education.save
        format.html { redirect_to inside_path, notice: 'Education was successfully created.' }
        format.json { render :show, status: :created, city: @education }
      else
        format.html { render :new }
        format.json { render json: @education.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /educations/1
  # PATCH/PUT /educations/1.json
  def update
    respond_to do |format|
      if @education.update(education_params.merge!(user: current_user))
        format.html { redirect_to inside_path, notice: 'Education was successfully updated.' }
        format.json { render :show, status: :ok, city: @education }
      else
        format.html { render :edit }
        format.json { render json: @education.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /educations/1
  # DELETE /educations/1.json
  def destroy
    @education.destroy
    respond_to do |format|
      format.html { redirect_to inside_path, notice: 'Education was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_education
      @education = Education.where(user: current_user).find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def education_params
      params.require(:education).permit(:name, :start_date, :end_date, :institution, :grade, :description)
    end
end
