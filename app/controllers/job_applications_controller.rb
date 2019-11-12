class JobApplicationsController < ApplicationController
  include Discard::Model

  def index
  end

  def new
    @job_applications = Job_Application.new
  end

  def create
    @job_posting = JobPosting.find(params[:job_posting_id])
    @job_application = Job_Application.create(job_applications_params)
    if @job_application.save
      notice: "Application Successful!"
      redirect_to job_applications_path
    else
      render :index
    end
  end

  def show
    @job_applications = Job_Application.all
  end

  def view
    @job_applications = Job_Application.find(params[:id])
  end

  def update
    @job_applications = Job_Application.find(params[:id])
    @job_applications.undiscard
      redirect_to job_applications_path, notice: "Job Application Undiscarded"
    if @job_applications.update_attributes(job_application_params)
      redirect_to job_applications_path
    else
      render :edit
    end

    def destroy
      @job_appplication.discard
      redirect_to job_applications_path, notice: "Job Application Removed"
    end

  end

  private

  def job_application_params
    params.require(:job_posting, :job_application).permit(:status, :job_posting_id, :employee_id)
    # .merge(employee_id: current_employee.id, job_posting_id: current_job_posting.id))
  end
end
