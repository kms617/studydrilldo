class Admin::UsersController < ApplicationController
before_filter :authorize!
  def index
    @users = User.order(created_at: :desc)
    @admins = @users.where(role: "admin")
    @members = @users.where(role: "member")
  end
end
