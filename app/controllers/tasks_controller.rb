class TasksController < ApplicationController
  before_action :authenticate_user!

  def new
    @task = Task.new(user_id: current_user.id)
  end

  def index
    @tasks = current_user.tasks.all
    @week_events = current_user.meetings.where(start_time: Date.today.monday..Date.today.monday+7.days).order(start_time: :asc)
  end

  def countdown_timer
    @task = Task.find(params[:id])
  end

  def create
    @task = Task.create(task_params)
    if @task.save
      redirect_to tasks_path, notice: "Task Added"
    else
      render :new
    end
  end

  def edit
    @task = Task.find(params[:id])
  end

  def update
    @task = Task.find(params[:id])
    if @task.update(task_params)
      redirect_to tasks_path, notice: "Task Updated"
    else
      redirect_to tasks_path, alert: "Task Not Updated"
    end
  end

  def destroy
    @task = Task.find(params[:id])
    @task.destroy
    if @task.destroy
      redirect_to tasks_path, notice: "Task Deleted"
    end
  end

  private
  def task_params
    params.require(:task).permit(:task, :done, :week_day, :remaining_time, :user_id)
  end
end
