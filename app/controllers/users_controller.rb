class UsersController < ApplicationController
  def following
      @user  = User.find(params[:id])
      @users = @user.following
      render 'show_follow'
  end

  def followers
    @user  = User.find(params[:id])
    @users = @user.followers
    render 'show_follower'
  end

  def show
    @user  = User.find_by_id(params[:id])
    @user = current_user
  end
  def edit
    @user = User.find(params[:id])
    render :layout => 'users'
  end
end
