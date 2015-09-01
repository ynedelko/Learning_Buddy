class CreateJoinLessonsStudents < ActiveRecord::Migration
  def change
    create_table(:lessons_students) do |t|
      t.column(:lesson_id, :int)
      t.column(:student_id, :int)
      t.column(:day, :datetime)

      t.timestamps()
    end
  end
end
