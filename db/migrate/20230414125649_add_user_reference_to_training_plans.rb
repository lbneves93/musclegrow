# frozen_string_literal: true

class AddUserReferenceToTrainingPlans < ActiveRecord::Migration[7.0]
  def change
    add_reference :training_plans, :user, type: :uuid, index: true, foreign_key: true
  end
end
