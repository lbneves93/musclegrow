# frozen_string_literal: true

class TrainingPlan < ApplicationRecord
  has_many :training_schedules, dependent: :destroy
  has_many :exercises, through: :training_schedules
  belongs_to :user
end
