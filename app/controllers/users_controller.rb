class UsersController < ApplicationController
  
  before_action :check_if_admin, :only => [:index ,:destroy]
  before_action :logged_in_user, only: [:edit, :update]

  def new
    @user = User.new
  end
 
  def show
    @user = User.find(params[:id])
  end
  
  def index
    # @users = User.all
    @users = User.paginate(page: params[:page])
  end
  
  def create
    @user = User.new(user_params)
    if @user.save
      #handle a successful save
      session[:user_id] = @user.id
      flash[:success] = "Your Login was successful! Welcome"
      redirect_to @user

    else
      render 'new'
    end
  end
 
  def edit
    @user = User.find params[:id]
  end
  
  def update
    @user = User.find params[:id]
    redirect_to(root_url) unless @user == current_user
    if @user.update(user_params)
      flash[:success] = "Profile updated"
      redirect_to @user
    else
    render :edit
    end
  end

  def destroy
   user = User.find params[:id]
      user.destroy
    flash[:success] = "User deleted"
    redirect_to users_url
  end
  private
  def user_params
    params.require(:user).permit(:name, :email_id, :phone_no, :password, :password_confirmation)
  end
  
  def check_if_admin
     unless logged_in? && current_user.admin? 
        redirect_to root_path 
        # unless @user.admin
      end
  end

  def logged_in_user
    unless logged_in?
      store_location
      flash[:danger] = "Please Log in "
      redirect_to login_path
    end
  end
end
