class HomeController < ApplicationController
  def index
    @exercises = Exercise.all
    @exercises_categories = ExerciseCategory.all
    @training_plan = TrainingPlan.where(user: current_user).last.presence || TrainingPlan.create(user: current_user)
    @schedule_exercises = @training_plan&.training_schedules.grouped_by_week_day.presence || []
  end
end