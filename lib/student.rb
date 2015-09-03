class Student <ActiveRecord::Base
  has_many(:feedbacks)
  has_many :lessons, through: :feedbacks
  validates(:name,  {:presence => true})
end
