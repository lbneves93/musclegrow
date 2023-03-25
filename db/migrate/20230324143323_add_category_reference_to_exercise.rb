class AddCategoryReferenceToExercise < ActiveRecord::Migration[7.0]
  def change
    add_reference :exercises, :exercise_category, type: :uuid, index: true, foreign_key: true
  end
end
