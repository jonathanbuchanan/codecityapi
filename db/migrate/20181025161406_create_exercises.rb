class CreateExercises < ActiveRecord::Migration[5.2]
  def change
    create_table :exercises do |t|
      t.string :title
      t.string :instructions
      t.string :type
      t.string :test_link
      t.string :exercise_link
      t.float :value

      t.timestamps
    end
  end
end
