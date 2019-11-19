class JobApplicationsController < ApplicationController
  # before_action :find_job_application, only: [:show, :create, :edit, :update, :destroy]

  def index
    @job_applications = JobApplication.all
    @job_postings = JobPosting.all
  end

  def new
    @job_application = JobApplication.new
  end

  def create
    @job_application = JobApplication.new(job_applications_params)
    if @job_application.save
      redirect_to @job_application, notice: "Job Application Complete"
    else
      render :new
    end
  end

  def show
  end


  def update
    @job_applications = JobApplication.find(params[:id])
    @job_applications.undiscard
      redirect_to job_applications_path, notice: "Job Application Undiscarded"
    if @job_applications.update_attributes(job_applications_params)
      redirect_to job_applications_path
    else
      render :edit
    end
  end
  
  def destroy
    @job_appplication.discard
    redirect_to job_applications_path, notice: "Job Application Removed"
  end

  private

  def job_applications_params
    parmas.require(:job_application).permit(:status, :job_posting_id, :employee_id)
    # params.require(:job_application).permit(:status, :job_posting_id, :employee_id)
  end

  # def find_job_application
  #   @job_application = JobApplication.find(params[:id])
  # end
end
