class TasksController < ApplicationController
  def index
    @tasks = Task.all
    @users = User.all
  end

  def create
    @task = Task.new(task_params)
    @task.save
    redirect_to task_index_path
  end

  def new
    @task = Task.new
  end

  def edit
    @task = Task.find_by!(id: params[:id])
  end

  def show
    @task = Task.find_by!(id: params[:id])
    @comments = Comment.where(task_id: params[:id])
  end

  def update
    @task = Task.find_by!(id: params[:id])
    @task.attributes = task_params
    @task.save

    redirect_to :task
  end

  def destroy
    @task = Task.find_by!(id: params[:id])
    @task.destroy

    redirect_to task_index_path
  end

  def task_params
    params.require(:task).permit(
        :name,
        :deadline,
        :staff
    )
  end
end
