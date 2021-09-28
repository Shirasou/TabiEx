class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :set_categories

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:email, :name, :sex, :introduction, :birth_at,])
  end

  def after_sign_up_path_for(resource)
    root_path
  end


  def after_sign_in_path_for(resource)
    root_path
  end

  def after_sign_out_path_for(resource)
    root_path
  end

  def set_categories
    @categories = Category.order("RAND()").limit(10)
  end
end
