class Admin::DashboardController < ApplicationController
    before_action :authenticate_user!
    before_action :only_admins
    load_and_authorize_resource
  
    def index
      # admin-specific data here
      @users = User.all.order(created_at: :desc)
    end
  
    private
  
    def only_admins
      redirect_to root_path, alert: "Access denied." unless current_user.admin?
    end
  end