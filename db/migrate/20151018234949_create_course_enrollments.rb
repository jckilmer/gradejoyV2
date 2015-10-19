class CreateCourseEnrollments < ActiveRecord::Migration
  def change
    create_table :course_enrollments do |t|
      t.references :course, null: false, index: true, foreign_key: true
      t.references :student, null: false, index: true, foreign_key: true
      t.integer :user_id, null: false, index: true, foreign_key: true
      t.boolean :archived_at
      t.timestamps
    end
  end
end
