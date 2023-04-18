# frozen_string_literal: true

class CreateTrainingSchedules < ActiveRecord::Migration[7.0]
  def change
    create_table :training_schedules, id: :uuid do |t|
      t.references :training_plan, type: :uuid, foreign_key: true
      t.references :exercise, type: :uuid, foreign_key: true
      t.integer :week_day
      t.timestamps
    end
  end
end
