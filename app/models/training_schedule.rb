# frozen_string_literal: true

class TrainingSchedule < ApplicationRecord
  belongs_to :training_plan
  belongs_to :exercise

  validates_presence_of :week_day
  validates :week_day, numericality: { in: 0..6 }

  scope :grouped_by_week_day, lambda {
    grouped_exercises = []
    order(:week_day).group_by(&:week_day).map do |key, value|
      grouped_exercises[key] = value.map do |schedule|
        schedule.exercise.name
      end
    end
    grouped_exercises
  }
end
