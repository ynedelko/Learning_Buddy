require('spec_helper')

describe(Feedback) do
  describe("#student") do
    it { should belong_to(:student) }
  end
  describe("#lesson") do
    it { should belong_to(:lesson) }
  end
end
