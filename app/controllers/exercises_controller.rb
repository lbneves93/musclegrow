# frozen_string_literal: true

class ExercisesController < ApplicationController
  def index
    @exercises = Exercise.all
    @exercises_categories = ExerciseCategory.all
  end
end
