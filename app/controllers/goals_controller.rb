class GoalsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_goal, only: [:edit, :update, :destroy]

  def index
    @goals = Goal.where(secret: false).order(created_at: :desc).includes(:user)
  end

  def new
    @goal = Goal.new
  end

  def create
    @goal = Goal.new(goal_params)
    @goal.user = current_user

    if @goal.save
      redirect_to @goal
      flash[:notice] = "Your goal has successfully been set!"
    else
      flash[:alert] = "There was a problem, please try again."
      render :new
    end
  end

  def show
    @goal = Goal.includes(:user, :tasks).find(params[:id])
    @user_image = @goal.user.profile_photo.thumb
    @my_allocation = @goal.actual_allocation
    @best_allocation = @goal.ideal_allocation
    gon.ideal_pie = @goal.ideal_array
    gon.actual_pie = @goal.actual_array
    gon.ongoing_pie = @goal.ongoing_array
    @advice = @goal.advice_calc(@best_allocation, @my_allocation)
    @ontrack = @goal.ontrack?(@best_allocation, @my_allocation)
  end

  def edit
    @goal = Goal.find(params[:id])
  end

  def update
    if @goal.update(goal_params)
      flash[:notice] = "Goal Updated"
      redirect_to goal_path
    else
      flash[:notice] = "There was a problem, please try again."
      render :edit
    end
  end

  def destroy
    if @goal.destroy
      flash[:notice] = "Goal Deleted"
      redirect_to goals_path
    else
      flash[:alert] = "There was a problem, please try again."
      render :edit
    end
  end

  private

  def set_goal
      @goal = Goal.authorized_find(current_user, params[:id])
  end

  def goal_params
    params.require(:goal).permit(:name, :duration, :completed, :objective, :secret, :user_id)
  end

  def authorize_user
    unless user_signed_in? and current_user.admin?
      raise ActionController::RoutingError.new('Not Found')
    end
  end

end
