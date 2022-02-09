# frozen_string_literal: true

class Client::SessionsController < Devise::SessionsController
  before_action :client_state, only:[:create]
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

  # ---------退会機能--------
  protected

  def client_state
    @client = Client.find_by(email: params[:client][:email])
    return if !@client
    if @client.valid_password?(params[:client][:password]) && @client.is_deleted
      redirect_to new_client_registration_path
    end
  end

end
