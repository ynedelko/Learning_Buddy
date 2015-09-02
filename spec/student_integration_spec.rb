require("spec_helper")

describe("the route a student will take", {:type => :feature}) do
  it("indexes to selecting name, pair and lesson") do
    visit("/students")
    fill_in("student_id", with: @test_student_1.id)
    fill_in("pair_id", with: @test_student_2.id)
    fill_in("lesson_id", with: @test_lesson.id)
    click_button("Continue")
    expect(page).to have_content("Thanks for checking in today")
  end
end
