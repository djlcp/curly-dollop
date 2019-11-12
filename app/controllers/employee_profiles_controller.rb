class EmployeeProfilesController < ApplicationController
  
  def show
    @employee = Employee.find(params[:id])
  end

end
