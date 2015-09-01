require("spec_helper")

describe("the route a teacher takes", {:type => :feature} ) do
    it("lists the students and lessons") do
        test_student = Student.create({:name => "Pamela Pankey"})
        visit("/teacher-admin/")
        expect(page).to have_content(test_student.name())
    end
end
