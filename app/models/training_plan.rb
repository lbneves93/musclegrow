class TrainingPlan < ApplicationRecord
  has_many :training_schedules, dependent: :destroy
  has_many :exercises, through: :training_schedules
end
