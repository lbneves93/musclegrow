class ExercisesController < ApplicationController
  def index
    @exercises = Exercise.all
    @exercises_categories = ExerciseCategory.all
  end
end