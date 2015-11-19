class FollowsController < ApplicationController

  def new
    @follow = current_user.follows.new(params[:follower_id])
  end

  def create
    @user = User.find(params[:id])
    @current_user.follow(@user)
    respond_to do |format|
      format.html{redirect_to :back}
      format.js {}
    end
  end

  def destroy
    @user = User.find(params[:id])
    @current_user.stop_following(@user)
    flash[:notice] = "Unfollowed!"
    respond_to do |format|
      format.html{redirect_to :back}
      format.js {render 'create'}
    end
  end

end
