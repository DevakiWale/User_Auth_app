# app/controllers/student/users_controller.rb
module Student
  class UsersController < ApplicationController

    before_action :authenticate_user!  # Ensures the user is authenticated
    before_action :only_admins, only: [:edit, :update, :destroy]  # Admin authorization
    load_and_authorize_resource  # Automatically loads @user and checks permissions

    def index
      # your code here
    end
    # Dashboard view (you can add any logic needed for the dashboard here)
    def dashboard
      # Example: @users could be a list of users or any data relevant to the dashboard
      @users = User.all
    end

    # Edit user profile (authorization and loading handled by CanCanCan)
    def edit
      # @user is already loaded by load_and_authorize_resource
    end

    # Update user profile
    def update
      if @user.update(user_params)
        redirect_to edit_student_user_path(@user), notice: "Profile updated successfully."
      else
        flash.now[:alert] = "There was an error updating your profile."
        render :edit
      end
    end

    # Destroy a user (admin-only action)
    def destroy
      @user.destroy
      redirect_to student_users_path, notice: "User deleted successfully."
    end

    # Show user profile (authorization and loading handled by CanCanCan)
    def show
      # @user is automatically loaded by load_and_authorize_resource
    end

    private

    # Admin-only filter, ensuring only admins can access certain actions
    def only_admins
      redirect_to root_path, alert: "You are not authorized to access this page." unless current_user.admin?
    end

    # Strong parameters for user data (only allow the attributes you need)
    def user_params
      params.require(:user).permit(:full_name, :phone_number, :address, :avatar)
    end
  end
end
