# app/controllers/student/users_controller.rb
module Student
  class UsersController < ApplicationController
    before_action :authenticate_user!
    before_action :only_admins, only: [:destroy, :edit, :update]
    load_and_authorize_resource

    def dashboard
      # Add any logic needed for the dashboard here
    end

    def edit
      @user = User.find(params[:id])
    end

    def update
      @user = User.find(params[:id])
      if @user.update(user_params)
        redirect_to edit_student_user_path(@user), notice: "Profile updated successfully."
      else
        render :edit
      end
    end

    def destroy
      @user = User.find(params[:id])
      @user.destroy
      redirect_to student_users_path, notice: "User deleted."
    end

    def show
      @user = User.find(params[:id])
    end

    private

    def only_admins
      unless current_user.admin?
        redirect_to root_path, alert: "You are not authorized to access this page."
      end
    end

    def user_params
      params.require(:user).permit(:full_name, :phone_number, :address, :avatar)
    end
  end
end
