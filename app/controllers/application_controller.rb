class ApplicationController < ActionController::Base
  include Accessible
    
  #Passing parameters for submitting the form 

  before_action :configure_permitted_parameters, if: :devise_controller?

  protected
  
  def configure_permitted_parameters
    added_attrs = [:email, :password, :password_confirmation, :remember_me, :last_name, :first_name, :profession_id]
    devise_parameter_sanitizer.permit(:sign_up, keys: added_attrs)  
    devise_parameter_sanitizer.permit(:account_update, keys: added_attrs)   
  end
  before_action :check_user

  def check_user
    if current_employer
      flash.clear
      # if you have rails_admin. You can redirect anywhere really
      #redirect_to(rails_employer.dashboard_path) && return
    elsif current_employee
      flash.clear
      # The authenticated root path can be defined in your routes.rb in: devise_scope :user do...
      # redirect_to(authenticated_employee_root_path) && return
    else
      authenticate_employee!
    end
  end
end
