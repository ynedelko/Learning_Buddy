class AlterTableFeedbackAndLessons < ActiveRecord::Migration
  def change
    remove_column(:lessons, :goals)
    remove_column(:feedbacks, :mood_causes)
    add_column(:feedbacks, :mood_cause, :string)
    add_column(:lessons, :objective, :string)
  end
end
