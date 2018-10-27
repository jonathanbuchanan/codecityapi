class AddRepositoryLinkToCourses < ActiveRecord::Migration[5.2]
  def change
    add_column :courses, :repository_link, :string
  end
end
