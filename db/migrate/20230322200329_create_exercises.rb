class CreateExercises < ActiveRecord::Migration[7.0]
  def change
    create_table :exercises, id: :uuid do |t|
      t.string :name
      t.string :img_url
      t.timestamps
    end
  end
end
