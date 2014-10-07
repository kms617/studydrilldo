class TasksController < ActiveRecord::Base
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
    @methodologies = Methodlogy.all

    if @task.save
      flash[:notice] = "Task successfully added."
      redirect_to goal_path(@task.goal)
    else
      flash[:alert] = "There was a problem, please try again."
      render goal_path(@task.goal)
    end
  end

  private

  def task_params
    params.require(:tasks).permit(:goal_id,
                                  :focus,
                                  :methodology_id,
                                  :completed,
                                  :duration,
                                  :description)
  end
end
