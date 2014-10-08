class TasksController < ApplicationController
  before_filter :prepare_methodologies

  def index
    @tasks = Task.all.order(created_at: :desc)
  end

  def show
    @task = Task.find(params[:id])
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)
    @methodologies = Methodology.all
    @goal = Goal.find(params[:goal_id])
    @task.goal = @goal

    if @task.save
      flash[:notice] = "Step successfully taken!"
      redirect_to goal_path(@task.goal_id)
    else
      flash[:alert] = "There was a problem, please try again."
      render 'goals/show'
    end
  end

  private

  def task_params
    params.require(:task).permit(:goal_id,
                                  :focus,
                                  :methodology_id,
                                  :completed,
                                  :duration,
                                  :description)
  end

  def prepare_methodologies
    @methodlogies = Methodology.all
  end
end
