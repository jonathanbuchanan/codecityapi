class AssociateExercisesAndCourses < ActiveRecord::Migration[5.2]
  def change
    change_table :exercises do |t|
      t.belongs_to :course, index: true
    end
  end
end
