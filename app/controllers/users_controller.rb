class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    @user.active = true
    @user.approved = true
    @user.confirmed = true
    if @user.save
      flash[:notice] = "Thanks for signing up!"
      redirect_to root_path
    else
      render :new
    end
  end

  def follow
    @user = User.find(params[:id])
    current_user.follow(@user)
    redirect_to root_path
  end

  def user_params
    params.require(:user).permit(:username, :email, :password)
  end

end
