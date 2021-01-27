# frozen_string_literal: true

class Users::SessionsController < Devise::SessionsController

  def create
    super
    welcome_message
  end

  private

  def welcome_message
    flash[:notice] = "Привет, #{current_user.first_name} #{current_user.last_name}!"
  end

  def after_sign_in_path_for(resource)
    stored_location_for(resource) ||
      if resource.admin?
        admin_tests_path
      else
        super
      end
  end

end
