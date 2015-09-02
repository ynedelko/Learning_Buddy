class Feedback <ActiveRecord::Base
  belongs_to(:lesson)
  belongs_to(:student)
  validates(:comment,  {:presence => true, :length => { :maximum => 160 }})
end
33
