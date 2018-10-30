class UsersController < ApplicationController
  before_action :authenticate_request, only: [:update, :destroy, :enroll, :disenroll]

  include JsonWebToken

  def index
    if params[:course_id].present?
      @users = Course.find(params[:course_id]).users
    else
      @users = User.all
    end
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

  def enroll
    @course = Course.find(params[:course_id])
    @user = User.find(params[:id])
    @user.courses << @course
    head :no_content
  end

  def disenroll
    @course = Course.find(params[:course_id])
    @user = User.find(params[:id])
    @user.courses.delete(@course)
    head :no_content
  end

  def authenticate
    @user = User.find_by(email: params[:email])
    if !@user.authenticate(params[:password])
      render json: { message: "authentication error" }
      return
    end
    token = encode({ user_id: @user.id }, 2.hours.from_now)
    render json: {
      token: token,
      message: "Successful login."
    }
  end
end
