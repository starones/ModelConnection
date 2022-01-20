class ApplicationController < ActionController::Base
   # ____devise名前新規登録追加____
  before_action :configure_permitted_parameters, if: :devise_controller?

  def after_sign_in_path_for(resource)
    case resource
    when Client
      client_client_path(@client)
    when Actor
      actor_path(@actor)
    end
  end

  def after_sign_up_path_for(resource)
    case resource
    when Client
      client_client_path(@client)
    when Actor
      actor_path(@actor)
    end
  end



  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :gender])
  end
  # ____ここまで____
end
