class AdminController < ApplicationController
  before_action :authenticate_user!
  before_action :only_admins

  def dashboard
  end

  private

  def only_admins
    redirect_to root_path, alert: "Not authorized" unless current_user.admin?
  end
end
