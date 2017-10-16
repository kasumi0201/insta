class PhotosController < ApplicationController
  before_action :set_photo, only: [ :edit, :update, :destroy,:search, :upvote, :downvote, :index,:show]
    before_action :correct_user,   only: :destroy

    # GET /photos
  # GET /photos.json
  def index
    @photos = Photo.all
    if params[:search]
      @photos = Photo.search(params[:search]).order("created_at DESC")
    else
      @photos = Photo.all.order("created_at DESC")
    end
  end

  def upvote
    @links = Photo.find(params[:id])
    @links.upvote_by current_user
    redirect_back fallback_location: root_path
    # ↑redirect_to :back の代わり
  end

  def downvote
    @links = Photo.find(params[:id])
    @links.downvote_by current_user
    redirect_back fallback_location: root_path
  end

  # GET /photos/1
  # GET /photos/1.json
  def show
    @photo = Photo.find(params[:id])
    puts "================"
    puts params
    #  @user = User.all
    @user  = User.find_by_id(params[:id])
    # current_user
    # @user.name = current_user.name
  end

  # GET /photos/new
  def new
    @photo =Photo.new
    # current_user.photos.build
  end

  # GET /photos/1/edit
  def edit
    @photo = Photo.find(params[:id])
  end

  # POST /photos
  # POST /photos.json

  def create
    @photo = Photo.new(photo_params)
    @photo.user = current_user
    respond_to do |format|
      if @photo.save
         format.any
        format.html { redirect_to @photo, notice: 'Photo was successfully created.' }
        format.json { render :show, status: :created, location: @photo }
      else
         format.any
        format.html { render :new }
        format.json { render json: @photo.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /photos/1
  # PATCH/PUT /photos/1.json


  def update
    if @photo.update_attributes(photo_params)
      flash[:success] = "Photo updated"
      redirect_to @photo
    else
      render 'edit'
    end
  end

  # DELETE /photos/1
  # DELETE /photos/1.json
  def destroy
    @photo.destroy
    respond_to do |format|
       format.any
      format.html { redirect_to photos_url, notice: 'Photo was successfully destroyed.' }
      format.json { head :no_content }
    end
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_photo
      @photo = Photo.find_by_id(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def photo_params
      params.require(:photo).permit(:image, :image_data, :caption, :body,:caption, :picture)
    end

    def correct_user
      @photo = current_user.photos.find_by(id: params[:id])
      redirect_to root_url if @photo.nil?
    end
end
