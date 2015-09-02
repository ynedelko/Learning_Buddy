class AddCommentColumnToFeedbacks < ActiveRecord::Migration
  def change
    add_column(:feedbacks, :comment, :string)
  end
end
