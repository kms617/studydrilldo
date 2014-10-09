class Admin::UsersController < ApplicationController
before_filter :authorize!
  def index
    @users = User.order(created_at: :desc)
    @admins = @users.where(role: "admin")
    @members = @users.where(role: "member")
  end

  def destroy
    user = User.find(params[:id])
    if user.destroy
      flash[:notice] = "User successfully deleted."
    else
      flash[:alert] = "Could not delete the user."
    end

    redirect_to admin_users_path
  end

end
