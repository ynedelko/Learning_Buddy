require("spec_helper")

describe("the route a teacher takes", {:type => :feature} ) do
    it("lists the students and lessons") do
        test_student = Student.create({:name => "Pamela Pankey"})
        visit("/teacher-admin/")
        expect(page).to have_content(test_student.name())
    end
    it("adds a new student to the roster") do
        visit("/teacher-admin/")
        fill_in('name', :with => "Yan Polski")
        click_button('Add Student')
        expect(page).to have_content("Yan Polski")
    end
    it("adds a new student to the roster") do
        visit("/teacher-admin/")
        fill_in('lesson_name', :with => "ABC")
        click_button('Add Lesson')
        expect(page).to have_content("ABC")
    end
end
