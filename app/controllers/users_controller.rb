class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
    @goals = Goal.where(user: current_user)
  end
end
