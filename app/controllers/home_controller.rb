class HomeController < ApplicationController
  def index
    @exercises = Exercise.all
    @exercises_categories = ExerciseCategory.all
    @training_plan = TrainingPlan.last.presence || TrainingPlan.create
    @schedule_exercises = @training_plan&.training_schedules.grouped_by_week_day.presence || []
  end
end