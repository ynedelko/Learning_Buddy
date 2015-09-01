require("spec_helper")

describe("the route a student will take", {:type => :feature}) do
  it("indexes to selecting name, pair and lesson") do
    visit("/students")
    fill_in("id", with: student_id)
    fill_in("id", with: pair_id)
    fill_in("id", with: lesson_id)
    click_button("Continue")
    expect(page).to have_content("student name and welcome")
  end
end
