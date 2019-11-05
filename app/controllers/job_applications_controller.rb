class JobApplicationsController < ApplicationController
  def index
  end

  def new
    @job_applications = Job_Application.new
  end

  def create
    @job_posting = JobPosting.find(params[:job_posting_id])
    @job_application = Job_Application.create(job_applications_params)
    if @job_application.save
      flash[:success] = "Application successful!"
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
    if @job_applications.update_attributes(job_application_params)
      redirect_to job_applications_path
    else
      render :edit
    end
  end

  # def destroy
  #   @job_application.destroy
  #   respond_to do |destroy|
  #     destroy.html {redirect_to job_postings_url, notice: 'Application was successfully deleted.'}
  #   end
  # end

  private
  
  def job_application_params
    params.require(:job_posting, :job_application).permit(
      :status, :employee_id, :job_posting_id)
      # .merge(employee_id: current_employee.id, job_posting_id: current_job_posting.id))
  end
end
