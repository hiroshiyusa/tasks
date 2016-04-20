class CommentsController < ApplicationController
  def new
    @comment = task.comments.build
  end

  def create
    @comment = task.comments.build
    @comment.attributes = comment_params
    @comment.save

    redirect_to task_path(id: task.id)
  end

  def show
    @comment = task.comments.find_by(id: params[:id])

  end

  def edit
    @comment = task.comments.find_by(id: params[:id])

  end

  def update
    @comment = task.comments.find_by(id: params[:id])
    @comment.attributes = comment_params
    @comment.save

    redirect_to task_path(id: task.id)
  end

  def destroy
    @comment = task.comments.find_by!(id: params[:id])
    @comment.destroy

    redirect_to task_path(id: task.id)
  end

  private
  def task
    @task = Task.find_by_id(params[:task_id])
  end

  def comment_params
    params.require(:comment).permit(
        :content
    )
  end
end
