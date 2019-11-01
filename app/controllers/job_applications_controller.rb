class JobApplicationsController < ApplicationController

  def index
    @job_applications = Job_Application.all
  end

  def show
  end

  def new
    @job_applications = Job_Application.new
  end

  def create
    # @job_applications = 
    @job_applications = Job_Application.new(job_applications_params.merge(employee_id: current_employee.id, job_posting_id: current_job_posting.id))
    if @ajob_pplications.save
      redirect_to job_applications_path
    else
      render :index
    end
  end

  def view
    @job_applications = Job_Application.find(params[:id])
  end

  def update
    @job_applications = Job_Application.find(params[:id])
    if @job_applications.update_attributes(job_application_params)
      redirect_to job_applications_path
    else
      render :edit
    end
  end

  private
  
  def job_application_params
    params.require(:job_application).permit(:status, :employee_id, :job_posting_id)
  end
end
