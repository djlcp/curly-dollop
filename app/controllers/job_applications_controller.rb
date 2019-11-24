class JobApplicationsController < ApplicationController
  before_action :find_job_application, only: [:show, :create, :edit, :update, :destroy]
  before_action :check_user

  def index
    @job_applications = JobApplication.all

    # @job_applications = if current_employee
    #   job_applications.current_employee
    #                     elsif current_employer
    #                       JobApplication.all
    #                     end
  end

  def new
    @job_application = JobApplication.new
  end

  def show
    @job_applications = JobApplication.find(params[:id])
    # redirect_to job_posting_job_applications_path
    # @job_applications = @job_posting_job_applications.find(employee: current_employee, status: :applied)
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
    @job_applications = JobApplication.find(params[:id])
    @job_applications.destroy
    redirect_to root_path notice: "Job Application Removed"
  end

  private

  def job_applications_params
    params.permit(:status, :job_posting_id, :employee_id)
    # .merge(employee_id: current_employee.id)
  end

  def find_job_application
    @job_application = JobApplication.find(params[:id])
  end
end
