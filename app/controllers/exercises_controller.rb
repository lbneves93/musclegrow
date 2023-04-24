# frozen_string_literal: true

class ExercisesController < ApplicationController
  before_action :load_exercise_categories
  before_action :fetch_exercise, only: %i[edit update]
  load_and_authorize_resource

  def index
    @exercises = Exercise.all
    @exercises_categories = ExerciseCategory.all
  end

  def new
    @exercise = Exercise.new
  end

  def create
    @exercise = Exercise.new(exercise_params)
    success_msg = 'Exercise created with success!'
    if @exercise.save
      return redirect_to exercises_path, status: :created,
                                         flash: { message: success_msg, type: :success }
    end

    flash[:message] = 'Error to create exercise!'
    flash[:type] = 'error'
    render :new, status: :unprocessable_entity
  end

  def update
    @exercise.assign_attributes(exercise_params)
    success_msg = 'Exercise updated with success!'

    return redirect_to exercises_path, flash: { message: success_msg, type: :success } if @exercise.save

    flash[:message] = 'Error to update exercise!'
    flash[:type] = 'error'
    render :edit, status: :unprocessable_entity
  end

  def edit; end

  private

  def exercise_params
    params.require(:exercise).permit(:name, :img_url, :exercise_category_id)
  end

  def load_exercise_categories
    @category_options = ExerciseCategory.all.map { |category| [category.name, category.id] }
  end

  def fetch_exercise
    @exercise = Exercise.find(params[:id])
  end
end
