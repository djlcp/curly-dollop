class JobPostingsController < ApplicationController
  def index
    @job_postings = current_employer.job_postings
  end

  def new
    @job_posting = JobPosting.new
    @job_posting.skills.build
  end

  def create
    @job_posting = JobPosting.new(job_posting_params)
    if @job_posting.save
      redirect_to root_path
    else
      @job_posting.skills.build if @job_posting.skills.blank?
      render :new
    end
  end

  def show
    @job_posting = JobPosting.find(params[:id])
  end

  def update
    @job_posting = JobPosting.find(params[:id])
    if @job_posting.update_attributes(job_posting_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  private
  
  def job_posting_params
    params.require(:job_posting).permit(
      :content, :start_time, :end_time, :hourly_rate,
      skills_attributes: [:id, :name, :_destroy]
    ).merge(employer_id: current_employer.id)
  end
end
