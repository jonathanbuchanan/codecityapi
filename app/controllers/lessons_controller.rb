class LessonsController < ApplicationController
  def index
    @course = Course.find(params[:course_id])
    @lessons = @course.lessons
    render json: @lessons
  end

  def show
    @lesson = Lesson.find(params[:id])
    render json: @lesson
  end

  def create
    @lesson = Lesson.create!(params.permit(:title, :slides, :value, :course_id))
    render json: @lesson
  end

  def update
    @lesson = Lesson.find(params[:id])
    @lesson.update(params.permits(:title, :slides, :value))
    head :no_content
  end

  def destroy
    @lesson = Lesson.find(params[:id])
    @lesson.delete
    head :no_content
  end
end
