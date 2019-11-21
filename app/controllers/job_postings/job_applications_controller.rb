module JobPostings
  class JobApplicationsController < ApplicationController
    before_action :set_job_posting
    before_action :check_user

    def create
      @job_application = @job_posting.job_applications.new(employee: current_employee, status: :applied)
      if @job_application.save
        redirect_to root_path, notice: 'Job Application was successful.'
      else
        redirect_to @job_posting
      end
    end

    private

    def set_job_posting
      @job_posting = JobPosting.find(params[:job_posting_id])
    end
  end
end