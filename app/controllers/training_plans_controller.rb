class TrainingPlansController < ApplicationController
  before_action :set_training_plan, only: [:update]

  def update
    TrainingSchedule.transaction do
      @training_plan.update(description: update_params[:description])
      @training_plan.training_schedules.destroy_all
      
      update_params[:training_schedules].each do |training_schedule|
        exercise_list = training_schedule[:exercise_names].present? ? JSON.parse(training_schedule[:exercise_names]) : []
        
        exercise_list.each do |exercise_name|
          exercise = Exercise.find_by(name: exercise_name)
          TrainingSchedule.create(training_plan: @training_plan, exercise: exercise, week_day: training_schedule[:week_day]) 
        end
      end
    end

    redirect_to root_path
  end

  private

  def set_training_plan
    @training_plan = TrainingPlan.find(params[:id])
  end

  def update_params
    params.require(:training_plan).permit(:description, training_schedules: [:week_day, :exercise_names])
  end
end