module JobPostings
  class JobApplicationsController < ApplicationController
    before_action :set_job_posting
    before_action :set_job_application
    before_action :check_user

    def create
      @job_application = @job_posting.job_applications.new(employee: current_employee, status: 2)
      if already_applied?
        redirect_to root_path, notice: "You can't apply more than once"
      else 
        @job_application.save
        redirect_to root_path, notice: 'Job Application was successful.'

      end
    end

    def show
      @job_posting = JobPosting.find(params[:job_posting_id])
      @job_application = JobApplication.find(params[:id])
    end

    def index
    end

    def accept
      @job_application.update_attributes(status: 0)
    end

    def reject
      @job_application.update_attributes(status: 1)
    end

    # Change status of job_application
    # def accept_application
    #   @job_application = JobApplication.find(params[:id])
    #   @job_application.update(status: params[:status = 1])
    #   redirect_to @job_posting, notice: 'Application has been Accepted. Employee will be notified.'
    # end
    #   if params[status: :accepted]== 'Accepted'
    #     @job_application.update_attributes(:status => 0)
        
    #     redirect_to :back, flash: {notice: "Application has been Accepted. Employee will be notified."}

    #   elsif params[status: :rejected]== 'Rejected'
    #     @job_application.update_attributes(:status => 1)
    #     redirect_to :back, flash: {notice: "Application has been Rejected. Employee will be notified."}

    #   elsif params[status: :applied]== 'Applied'
    #     @job_application.update_attributes(:status => 3)
    #     redirect_to root_path, flash: {notice: "Waiting for Response"}
    #   end
    # end

    private

    def job_applications_params
      params.permit(:status, :id, :job_posting_id, :employee_id, :employer_id)
      # .merge(employee_id: current_employee.id)
    end  

    def set_job_posting
      @job_posting = JobPosting.find(params[:job_posting_id])
    end

    def set_job_application
      @job_application = JobApplication.find(params[:id])
    end

    def already_applied?
      @job_application = JobApplication.where(employee_id: current_employee.id, job_posting_id:
      params[:job_posting_id]).exists?
    end
    

    # def already_accepted?
    #   JobApplication.where(employee_id: current_employee.id, job_posting_id:
    #   params[:job_posting_id]).exists?
    # end

  end
end