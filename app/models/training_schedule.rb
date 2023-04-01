class TrainingSchedule < ApplicationRecord
  belongs_to :training_plan
  belongs_to :exercise

  validates_presence_of :week_day
  validates :week_day, numericality: { in: 0..6 }

  scope :grouped_by_week_day, -> {
    grouped_exercises = [] 
    order(:week_day).group_by(&:week_day).map{ |key, value| grouped_exercises[key] = value.map{|schedule| schedule.exercise.name } }
    grouped_exercises 
  }

end
