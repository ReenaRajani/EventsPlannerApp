class SessionsController < ApplicationController
  def new
  end
  def create
    user = User.find_by(email_id: params[:session][:email_id].downcase)
    if user.present? && user.authenticate(params[:session][:password])
      session[:user_id] = user.id #logs in the give user 
      params[:session][:remember_me] == '1' ? remember(user) : forget(user)
      redirect_to user # redirected to the main page 

    else
      flash[:danger] = 'Invalid email/password combination'
      redirect_to login_path
    end
  end
  def destroy
    forget(current_user)
    session[:user_id] = nil
    @current_user = nil
    redirect_to root_path

  end

  


end
