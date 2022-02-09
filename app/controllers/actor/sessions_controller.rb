# frozen_string_literal: true

class Actor::SessionsController < Devise::SessionsController
  before_action :actor_state, only:[:create]
  # before_action :configure_sign_in_params, only: [:create]

  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  # def create
  #   super
  # end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end

  # ---------退会機能---------
  protected

  def actor_state
    @actor = Actor.find_by(email: params[:actor][:email])
    return if !@actor
    if @actor.valid_password?(params[:actor][:password]) && @actor.is_deleted
      redirect_to new_actor_registration_path
    end
  end

end
