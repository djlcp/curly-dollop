class LandingPagesController < ApplicationController
  def index
    @job_postings = JobPosting.all
  end
end
