class SessionsController < ApplicationController

  before_action :redirect_if_logged, only: %i[new create]

  def new; end

  def create
    user = User.find_by(email: params[:email])

    if user&.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to session.delete(:wanted_page) || root_path
    else
      flash.now[:alert] = 'Verify email and password!'
      render :new
    end
  end

  def destroy
    reset_session
    redirect_to login_path
  end

end
