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
    it("updates a student's name") do
        test_student = Student.create({:name => "Jimbob Johnson"})
        visit("/students/#{test_student.id()}")
        fill_in('name', :with => "Bobjim Jones")
        click_button("Rename #{test_student.name}")
        expect(page).to have_content("Bobjim Jones")
    end
    it("deletes a student") do
        test_student = Student.create({:name => "Yan Polski"})
        visit("/students/#{test_student.id()}")
        click_button("Delete #{test_student.name}")
        expect(page).to have_no_content("Yan Polski")
    end
end
