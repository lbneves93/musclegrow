class ExerciseCategory < ApplicationRecord
  has_many :exercises, dependent: :destroy

  validates_presence_of :name, :img_url
  validates :name, uniqueness: { case_sensitive: false }
end
