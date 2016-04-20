class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new
    @user.attributes = user_params
    @user.save

    redirect_to tasks_path
  end

  def index
  end

  def show
    @user = User.find_by!(id: params[:id])
  end

  def edit
    @user = User.find_by!(id: params[:id])
  end

  def update
    @user = User.find_by!(id: params[:id])
    @user.attributes = user_params
    @user.save

    redirect_to tasks_path
  end

  def destroy
    @user= User.find_by!(id: params[:id])
    @user.destroy

    redirect_to tasks_path
  end

  private
  def user
    @user = User.find_by_id(params[:user_id])
  end

  def user_params
    params.require(:user).permit(
        :name, :email
    )
  end
end
