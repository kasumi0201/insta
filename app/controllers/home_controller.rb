class HomeController < ApplicationController
  def index
    @photos = Photo.all
    @user = User.all
    if user_signed_in?
  @photo  = current_user.photos.build
  @feed_items = current_user.feed.paginate(page: params[:page])
end
  end

    def home
      @photo = current_user.photos.build if logged_in?
    end

    def help
    end

    def about
    end

    def contact
    end
end
