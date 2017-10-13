class UsersController < ApplicationController
  before_action :logged_in_user, only: [:index, :edit, :update, :destroy]
  before_action :correct_user,   only: [:edit, :update]
   before_action :admin_user,     only: :destroy
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
    # @user.id = User.find_by_id(params[:id])
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
  end
    def index
      @users = User.find(params[:id])
      # User.where(activated: FILL_IN).paginate(page: params[:page])
    end

    # def show
    #   @user = User.find(params[:id])
    #   redirect_to root_url
    #   # and return unless FILL_IN
    # end

  def follow
  end

  def destroy
  User.find(params[:id]).destroy
  flash[:success] = "User deleted"
  redirect_to users_url
  end

  private

    def user_params
      params.require(:user).permit(:name, :email, :password,
                                   :password_confirmation)
    end

    # beforeフィルター

    # 正しいユーザーかどうかを確認
    def correct_user
      @user = User.find(params[:id])
      redirect_to(root_url) unless current_user?(@user)
    end

    # 管理者かどうかを確認
    def admin_user
      redirect_to(root_url) unless current_user.admin?
    end

end
