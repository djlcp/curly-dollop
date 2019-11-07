class EmployerProfilesController < ApplicationController
    
  def index
    @employers = Employer.all
  end
    
  def show
    @employer = current_employer
  end
    
end
