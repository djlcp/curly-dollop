class SkillsController < ApplicationController
  def index
  end

  def new
    @skill = Skill.new
  end

  def create
    @job_posting = JobPosting.find(params[:job_posting_id])
    @skill = @job_posting.skills.create(params[:skill].permit(skill_params))
    if @skill.save
      redirect_to root_path
    else
      render :index
    end
  end

  def show
  end
  
  def view
    @skill = Skill.find(params[:id])
  end

  def update
    @skill = Skill.find(params[:id])
  end

  private

  def skill_params
    params.require(:skill).permit(:name, :type)
  end
end
