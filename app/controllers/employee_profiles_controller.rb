class EmployeeProfilesController < ApplicationController
  before_action :set_employee_profile, only: [:show, :edit, :update, :destroy]

  # GET /employee_profiles/1
  # GET /employee_profiles/1.json
  def show
  end

  # GET /employee_profiles/new
  def new
    @employee_profile = EmployeeProfile.new
  end

  # GET /employee_profiles/1/edit
  def edit
  end

  # POST /employee_profiles
  # POST /employee_profiles.json
  def create
    @employee_profile = EmployeeProfile.new(employee_profile_params)

    respond_to do |format|
      if @employee_profile.save
        format.html { redirect_to @employee_profile, notice: 'Employee profile was successfully created.' }
        format.json { render :show, status: :created, location: @employee_profile }
      else
        format.html { render :new }
        format.json { render json: @employee_profile.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /employee_profiles/1
  # PATCH/PUT /employee_profiles/1.json
  def update
    respond_to do |format|
      if @employee_profile.update(employee_profile_params)
        format.html { redirect_to @employee_profile, notice: 'Employee profile was successfully updated.' }
        format.json { render :show, status: :ok, location: @employee_profile }
      else
        format.html { render :edit }
        format.json { render json: @employee_profile.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /employee_profiles/1
  # DELETE /employee_profiles/1.json
  def destroy
    @employee_profile.destroy
    respond_to do |format|
      format.html { redirect_to employee_profiles_url, notice: 'Employee profile was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_employee_profile
      @employee_profile = EmployeeProfile.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def employee_profile_params
      params.require(:employee_profile).permit(:first_name, :last_name, :date_of_birth)
    end
end