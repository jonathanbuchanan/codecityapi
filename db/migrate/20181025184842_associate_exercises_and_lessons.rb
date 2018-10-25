class AssociateExercisesAndLessons < ActiveRecord::Migration[5.2]
  def change
    change_table :exercises do |t|
      t.belongs_to :lesson, index: true
      t.remove_references :course, index: true
    end
  end
end
