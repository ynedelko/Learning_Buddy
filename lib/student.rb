class Student <ActiveRecord::Base
  has_many(:feedbacks)
  validates(:name,  {:presence => true})
end
