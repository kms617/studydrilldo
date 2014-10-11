class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
    @user_goals = @user.goals.order(created_at: :desc)
    @user_tasks = @user.tasks.order(created_at: :desc)
  end
end
