require("spec_helper")

describe(Lesson) do
  describe("#feedbacks") do
    it { should have_many(:feedbacks) }
  end
end
