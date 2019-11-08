class ApplicationController < ActionController::Base
    
  #Passing parameters for submitting the form 

  before_action :configure_permitted_parameters, if: :devise_controller?

  protected
  
  def configure_permitted_parameters
    columns = %i[first_name last_name phone_number business_name]
    devise_parameter_sanitizer.permit(:sign_up, keys: columns)  
    devise_parameter_sanitizer.permit(:account_update, keys: columns)   
  end
end
