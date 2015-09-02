class Feedback <ActiveRecord::Base
  belongs_to(:lesson)
  belongs_to(:student)
  # validates(:comment,  {:presence => true, :length => { :maximum => 160 }})
  # before_save(:mood_counter)

  private

    # def mood_counter
    #   if self.mood == 1
    #   self.sad_count = sad_count + 1
    #   elsif self.mood == 2
    #     self.neutral_count = neutral_count + 1
    #   elsif self.mood == 3
    #     self.happy_count = happy_count + 1
    #   else
    #      nil
    #   end
    #   self.total = self.sad_count + self.neutral_count + self.happy_count
    # end
end
