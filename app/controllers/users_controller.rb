# app/controllers/users_controller.rb
class UsersController < ApplicationController
  before_action :authenticate_user!  # Ensures the user is authenticated
  load_and_authorize_resource  # Automatically loads @user and checks permissions for actions

  # Show the user's profile (accessible to authenticated users)
  def show
    # @user is automatically loaded by load_and_authorize_resource
  end

  # Edit the user's profile (only authenticated user can edit their own profile)
  def edit
    # @user is already loaded by load_and_authorize_resource
    # You may want to include logic to only allow users to edit their own profiles.
  end

  # Update the user's profile (same user-check logic)
  def update
    if @user.update(user_params)
      redirect_to user_path(@user), notice: "Profile updated successfully."
    else
      flash.now[:alert] = "There was an error updating your profile."
      render :edit
    end
  end

  # Destroy the user's account (admin-only action or user-specific)
  def destroy
    @user.destroy
    redirect_to root_path, notice: "Your account has been deleted."
  end

  private

  # Ensure the current user is only able to edit their own profile
  def check_user_ownership
    redirect_to root_path, alert: "You are not authorized to access this page." unless current_user == @user
  end

  # Strong parameters for user data
  def user_params
    params.require(:user).permit(:full_name, :phone_number, :address, :avatar)
  end
end
