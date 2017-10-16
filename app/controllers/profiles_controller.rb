class ProfilesController < ApplicationController
  def index
    @profile = Profile.find_by(user: current_user)
    @username = @profile.username
    @profiles = Profile.all
  end

  def show
    #@profile = current_user.profile
    # @profile = Profile.find(user: current_user.id)

    @profile = Profile.find_by(user: current_user.id)
    # @profile = Profile.find_by(user_id: current_user.id)

    redirect_to edit_profile_path if @profile.nil?

  end

  def new
  end

  def create
    @profile = Profile.new(profile_params)
    @profile.user = current_user
    binding.pry
    respond_to do |format|
      if @profile.save
        format.html { redirect_to @profile, notice: 'profile was successfully created.' }
      else
        format.html { render :edit }
      end
    end
  end

  def edit
    @profile = Profile.find_by(user: current_user)
    @profile = Profile.new(user: current_user) if @profile.nil?
  end

  def update
    # コンソール確認用
    # puts "params is: #{params.inspect}"
    # puts "profile_params is: #{profile_params.inspect}"
    # puts "profile_params[:user_id] is: #{profile_params[:user_id]}"
    if @profile.update(profile_params)
      flash[:success] = "profile updated"
      redirect_to @profile
    else
      render 'edit'
    end
    end



  def destroy
  end
end

private
def profile_params
  params.require(:profile).permit(:username,:first_name,:last_name,:bio)
end
