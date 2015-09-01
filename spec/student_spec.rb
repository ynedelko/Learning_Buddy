require("spec_helper")

describe(Student) do
  describe("#lessons") do
    it { should have_and_belong_to_many(:lessons) }
  end
end
