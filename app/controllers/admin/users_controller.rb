class Admin::UsersController < ApplicationController
before_filter :authorize!
  def index
    @users = User.order(created_at: :desc)
  end
end
