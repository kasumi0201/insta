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
    @user = current_user
    @user.name = User.find_by_id(params[:id])
    @photos = Photo.where(user_id: @user.id)
    # @photos = @user.photos.paginate(page: params[:page])
  end

  def create
    @user = User.new(user_params)

    if @user.save
      # @user.send_activation_email
      # flash[:info] = "Please check your email to activate your account."
      redirect_to root_url
    else
      render 'new'
    end

    def index
      @users = User.find(params[:id])
      # User.where(activated: FILL_IN).paginate(page: params[:page])
    end

    def show
      @user = User.find(params[:id])
      redirect_to root_url and return unless FILL_IN
    end
  end


end
