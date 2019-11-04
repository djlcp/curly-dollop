class JobApplicationsController < ApplicationController
  def index
    @job_applications = JobApplication.all
    @job_postings = JobPosting.all
  end

  def show
    @job_posting = JobPosting.find(params[:id])
  end
end
