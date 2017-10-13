class HomeController < ApplicationController
  def index
    @photos = Photo.all
    @user = current_user
    if user_signed_in?
  @photo  = current_user.photos.build
  # @feed_items = current_user.feed.paginate(page: params[:page])
  end

end

  def home
          @user = current_user
    if user_signed_in?
      @photo  = current_user.photos.build
      # @feed_items = current_user.feed.paginate(page: params[:page])
    end

    def help
    end

    def about
    end

    def contact
    end
end
end
