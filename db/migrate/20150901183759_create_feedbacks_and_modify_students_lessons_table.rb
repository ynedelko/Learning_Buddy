class CreateFeedbacksAndModifyStudentsLessonsTable < ActiveRecord::Migration
  def change
    drop_table(:lessons_students)

    create_table(:feedbacks) do |t|
      t.column(:lesson_id, :int)
      t.column(:student_id, :int)
      t.column(:pair_id, :int)
      t.column(:mood, :int)
      t.column(:mood_causes, :string)
      t.column(:comment, :string)
    end
    add_column(:lessons, :day, :datetime)
    remove_column(:students, :pair)

  end
end
