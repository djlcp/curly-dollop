class JobApplicationsController < ApplicationController
  before_action :find_job_application, only: [:show, :create, :edit, :update, :destroy]
  before_action :check_user

  def index
    @job_applications = JobApplication.all
  end

  def new
    @job_application = JobApplication.new
  end

  def show
    @job_application = JobApplication.find(params[:id])
    @job_posting = JobPosting.all
  end

  def update
    @job_application = JobApplication.find(params[:id])
    @job_application.undiscard
      redirect_to job_applications_path, notice: 'Job Application Undiscarded'
    if @job_application.update_attributes(job_applications_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  def destroy
    @job_application = JobApplication.find(params[:id])
    @job_application.destroy
    redirect_to root_path, notice: 'Job Application Removed'
  end

  private

  def job_applications_params
    params.permit(:status, :job_posting_id, :employee_id, :employer_id)
    # .merge(employee_id: current_employee.id)
  end

  def find_job_application
    @job_application = JobApplication.find(params[:id])
  end

end
