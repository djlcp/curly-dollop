module JobPostings
  class JobApplicationsController < ApplicationController
    before_action :set_job_posting
    before_action :check_user

    def create
      @job_application = @job_posting.job_applications.new(employee: current_employee, status: :applied)
      if already_applied?
        redirect_to root_path
        flash[:notice] = "You can't apply more than once"
      else 
        @job_application.save
        redirect_to root_path, notice: 'Job Application was successful.'

      end
    end

    def show
      @job_application = JobApplication.all
      @job_posting = JobPosting.all
    end

    private

    def set_job_posting
      @job_posting = JobPosting.find(params[:job_posting_id])
    end

    def already_applied?
      JobApplication.where(employee_id: current_employee.id, job_posting_id:
      params[:job_posting_id]).exists?
    end

  end
end