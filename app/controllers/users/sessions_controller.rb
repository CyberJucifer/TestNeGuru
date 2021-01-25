# frozen_string_literal: true

class Users::SessionsController < Devise::SessionsController

  before_action :configure_sign_in_params, only: [:create]

  after_action :welcome_message, only: :create

  # GET /resource/sign_in
   def new
     super
   end

  # POST /resource/sign_in
   def create
     super
   end

  # DELETE /resource/sign_out
   def destroy
     super
   end

  private

  def configure_sign_in_params
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name])
  end

  def welcome_message
    flash[:notice] = "Привет, #{current_user.first_name} #{current_user.last_name}!"
  end

  def after_sign_in_path_for(resource)
    current_user.is_a?(Admin) ? admin_tests_path : root_path
  end

end
