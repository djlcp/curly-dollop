class JobApplicationsController < ApplicationController
  before_action :find_job_application, only: %i[show create edit update destroy accept reject]
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

  def accept
    @job_application.update_attributes(status: 0)
    redirect_to root_path, notice: "Application Approved"
  end

  def reject
    @job_application.update_attributes(status: 1)
    redirect_to root_path, notice: "Application Rejected"
  end

  def destroy
    @job_application = JobApplication.find(params[:id])
    @job_application.destroy
    redirect_to root_path, notice: 'Job Application Removed'
  end

  private

  def job_applications_params
    params.permit(:status, :job_posting_id, :employee_id, :employer_id)
  end

  def find_job_application
    @job_application = JobApplication.find(params[:id] || params[:job_application_id])
  end

end
