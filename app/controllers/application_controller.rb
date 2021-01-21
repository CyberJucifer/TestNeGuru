class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  helper_method :current_user,
                :logged_in?

  private

  def authenticate_user!
    unless current_user
      save_wanted_page
      redirect_to login_path
    end
  end

  def current_user
    @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
  end

  def logged_in?
    current_user.present?
  end

  def redirect_if_logged
    redirect_to tests_path if logged_in?
  end

  def save_wanted_page
    session[:wanted_page] = request.env['PATH_INFO']
  end

end
