class CreateTrainingPlans < ActiveRecord::Migration[7.0]
  def change
    create_table :training_plans, id: :uuid do |t|
      t.string :description
      t.timestamps
    end
  end
end
