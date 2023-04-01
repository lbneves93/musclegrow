class Exercise < ApplicationRecord
  belongs_to :exercise_category
  has_many :training_schedules, dependent: :destroy
  has_many :training_plans, through: :training_schedules
  
  validates_presence_of :name, :img_url
  validates :name, uniqueness: { case_sensitive: false }
end
