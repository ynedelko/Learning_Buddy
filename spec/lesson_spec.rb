require("spec_helper")

describe(Lesson) do
  describe("#students") do
    it { should have_and_belong_to_many(:students) }
  end
end
