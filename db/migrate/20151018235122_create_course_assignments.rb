class CreateCourseAssignments < ActiveRecord::Migration
  def change
    create_table :course_assignments do |t|
      t.references :course, null: false, index: true, foreign_key: true
      t.references :assignment, null: false, index: true, foreign_key: true
      t.integer :user_id, null: false, index: true, foreign_key: true
      t.datetime :archived_at
      t.timestamps
    end
  end
end
