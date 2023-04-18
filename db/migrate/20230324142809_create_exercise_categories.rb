# frozen_string_literal: true

class CreateExerciseCategories < ActiveRecord::Migration[7.0]
  def change
    create_table :exercise_categories, id: :uuid do |t|
      t.string :name
      t.string :img_url
      t.timestamps
    end
  end
end
