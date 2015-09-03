class Feedback <ActiveRecord::Base
  belongs_to(:lesson)
  belongs_to(:student)
  validates(:comment,  {:length => { :maximum => 160 }})
end
