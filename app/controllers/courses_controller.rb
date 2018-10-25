class CoursesController < ApplicationController
  def index
    @courses = Course.all
    render json: @courses
  end

  def show
    @course = Course.find(params[:id])
    render json: @course
  end

  def create
    @course = Course.create!(params.permit(:title))
    render json: @course
  end

  def update
    @course = Course.find(params[:id])
    @course.update(params.permit(:title))
    head :no_content
  end

  def destroy
    @course = Course.find(params[:id])
    @course.delete
    head :no_content
  end
end
