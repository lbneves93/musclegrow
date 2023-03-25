class Exercise < ApplicationRecord
  belongs_to :exercise_category

  validates_presence_of :name, :img_url
end
