class ExercisesController < ApplicationController
  def index
    @lesson = Lesson.find(params[:lesson_id])
    @exercises = @lesson.exercises
    render json: @exercises
  end

  def show
    @exercise = Exercise.find(params[:id])
    render json: @exercise
  end

  def create
    @exercise = Exercise.create!(params.permit(:title, :instructions, :exercise_type, :test_link, :exercise_link, :value, :lesson_id))
    render json: @exercise
  end

  def update
    @exercise = Exercise.find(params[:id])
    @exercise.update(params.permit(:title, :instructions, :type, :test_link, :exercise_link, :value))
    head :no_content
  end

  def destroy
    @exercise = Exercise.find(params[:id])
    @exercise.delete
    head :no_content
  end
end
