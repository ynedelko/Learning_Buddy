class AddColumnsToFeedbacks < ActiveRecord::Migration
  def change
    add_column(:feedbacks, :sad_count, :int)
    add_column(:feedbacks, :neutral_count, :int)
    add_column(:feedbacks, :happy_count, :int)
    add_column(:feedbacks, :total, :int)
  end
end
