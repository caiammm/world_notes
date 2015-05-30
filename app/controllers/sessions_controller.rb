class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.password == params[:session][:password]
      log_in user
      redirect_to root_path
    else
      flash.now[:danger] = 'Email ou Senha inválidos'
      render 'new'
    end
  end

  def destroy
    log_out if logged_in?
    redirect_to root_url
  end

  def previous_url
    session[:return_to] ||= request.referer || root_url
  end
end
