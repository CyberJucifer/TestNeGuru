class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  helper_method :current_user,
                :logged_in?,
                :flash_verify,
                :save_wanted_page

  private

  def authenticate_user!
    unless current_user
      redirect_to login_path
      flash_verify
    end
  end

  def current_user
    @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
  end

  def logged_in?
    current_user.present?
  end

  def flash_verify
    flash[:alert] = 'Verify Email and Password!'
  end

  def redirect_if_logged
    redirect_to tests_path if logged_in?
  end

  def save_wanted_page
    session[:wanted_page] = request.env['PATH_INFO']
  end

end
