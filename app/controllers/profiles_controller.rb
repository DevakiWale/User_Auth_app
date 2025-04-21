class ProfilesController < ApplicationController
    before_action :authenticate_user!
    before_action :set_profile, only: %i[show edit update]
  
    def show
    end
  
    def edit
    end
  
    def update
      if @profile.update(profile_params)
        redirect_to profile_path, notice: "Profile updated successfully."
      else
        render :edit, alert: "Something went wrong."
      end
    end
  
    private
  
    def set_profile
      @profile = current_user.profile || current_user.create_profile
    end
  
    def profile_params
      params.require(:profile).permit(:full_name, :phone, :address, :avatar)
    end
  end
  