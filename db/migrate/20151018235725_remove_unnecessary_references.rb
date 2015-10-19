class RemoveUnnecessaryReferences < ActiveRecord::Migration
  def change
    remove_column :assignments, :course_id
    remove_column :students, :course_id
    remove_column :assignments, :category
    add_reference :assignments, :category, foreign_key: true, index: true
  end
end
