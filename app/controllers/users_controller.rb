class UsersController < ApplicationController
  def index
    @users = User.all
    render json: @users
  end

  def show
    @user = User.find(params[:id])
    render json: @user
  end

  def create
    @user = User.create!(params.permit(:is_teacher, :first_name, :last_name, :email, :password))
    render json: @user
  end

  def update
    @user = User.find(params[:id])
    @user.update(params.permit(:is_teacher, :first_name, :last_name, :email, :password))
    head :no_content
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    head :no_content
  end
end
