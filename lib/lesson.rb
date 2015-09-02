class Lesson <ActiveRecord::Base
  has_many(:feedbacks)
  has_many :students, through: :feedbacks
  validates(:name,  {:presence => true})
end
