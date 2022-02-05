class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  # ---------ログイン、新規登録後遷移先---------
  def after_sign_in_path_for(resource)
    case resource
    when Client
      client_client_path(@client)
    when Actor
      actor_path(@actor)
    when Admin
      admin_top_path
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
  # -------ここまで------------

  protected

  # ____devise名前新規登録追加____
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :gender])
  end
end
