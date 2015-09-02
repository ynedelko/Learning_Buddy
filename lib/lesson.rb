class Lesson <ActiveRecord::Base
  has_many(:feedbacks)
  validates(:name,  {:presence => true})
end
