require("spec_helper")

describe(Student) do
  describe("#feedbacks") do
    it { should have_many(:feedbacks) }
  end
end
