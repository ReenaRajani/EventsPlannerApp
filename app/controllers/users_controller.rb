class UsersController < ApplicationController
  
  before_action :check_if_admin, :only => [:index]

  def new
    @user = User.new
  end
 
  def show
    @user = User.find(params[:id])
  end
  def index
    @users = User.all
  end
  def create
    @user = User.new(user_params)
    if @user.save
      #handle a successful save
      flash[:success] = "Your Login was successful! Welcome"
      redirect_to @user

    else
      render 'new'
    end
  end
  def edit
    @user = @current_user
  end
  def update
    user = @current_user
    if user.update(user_params)
      redirect_to root_path
    else
    render :edit
    end
  end

  private
  def user_params
    params.require(:user).permit(:name, :email_id, :phone_no, :password, :password_confirmation)
  end
  def check_if_admin
    redirect_to root_path unless @current_user.present? && @current_user.admin?
  end
end
