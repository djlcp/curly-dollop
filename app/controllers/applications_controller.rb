class ApplicationsController < ApplicationController

  def index
  end

  def show
  end

  def new
    @application = Application.new
  end

  def create
    # @application = 
    @application = Application.new(application_params.merge(employee_id: current_employee.id, job_posting_id: current_job_posting.id))
    if @application.save
      redirect_to applications_path
    else
      render :index
    end
  end

  def view
    @Application = Application.find(params[:id])
  end

  def update
    @Application = Application.find(params[:id])
    if @application.update_attributes(application_params)
      redirect_to applications_path
    else
      render :edit
    end
  end

  private
  
  def application_params
    params.require(:application).permit(:status, :employee_id, :job_posting_id)
  end
end
