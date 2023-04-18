# frozen_string_literal: true

class TrainingPlansController < ApplicationController
  before_action :set_training_plan, only: [:update]

  def update
    authorize! :update, @training_plan

    TrainingSchedule.transaction do
      @training_plan.update(description: update_params[:description])
      @training_plan.training_schedules.destroy_all
      create_training_schedules
    end

    redirect_to root_path, flash: { message: 'Training plan updated with success!', type: :success }
  end

  private

  def set_training_plan
    @training_plan = TrainingPlan.find(params[:id])
  end

  def update_params
    params.require(:training_plan).permit(:description, training_schedules: %i[week_day exercise_names])
  end

  def create_training_schedules
    update_params[:training_schedules].each do |training_schedule|
      exercises = training_schedule[:exercise_names].present? ? JSON.parse(training_schedule[:exercise_names]) : []

      exercises.each do |exercise_name|
        exercise = Exercise.find_by(name: exercise_name)
        TrainingSchedule.create(training_plan: @training_plan, exercise:,
                                week_day: training_schedule[:week_day])
      end
    end
  end
end
