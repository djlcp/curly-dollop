class EmployeeProfilesController < ApplicationController
  
  def index
    @employees = Employee.all
  end

  def show
    @employee = current_employee
  end

end
