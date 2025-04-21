
class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_path, alert: "Access denied!"
  end
  
  protected

  def after_sign_in_path_for(resource)
    if resource.admin?
      admin_dashboard_path
    elsif resource.teacher?
      teacher_dashboard_path
    elsif resource.student?
      student_user_dashboard_path
    else
      root_path
    end
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:full_name, :phone_number, :address, :avatar])
    devise_parameter_sanitizer.permit(:account_update, keys: [:full_name, :phone_number, :address, :avatar])
  end
end
  

