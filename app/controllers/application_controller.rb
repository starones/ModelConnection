class ApplicationController < ActionController::Base
   # ____devise名前新規登録追加____
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end
  # ____ここまで____
end
