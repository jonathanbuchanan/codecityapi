class CreateLessons < ActiveRecord::Migration[5.2]
  def change
    create_table :lessons do |t|
      t.string :title
      t.string :slides
      t.float :value

      t.timestamps
    end
  end
end
