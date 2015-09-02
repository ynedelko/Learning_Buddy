ENV['RACK_ENV'] = 'test'

require("bundler/setup")
Bundler.require(:default, :test)
set(:root, Dir.pwd())

require("lesson")
require("student")
require("feedback")


RSpec.configure do |config|
  config.after(:each) do
    Lesson.all().each() do |lesson|
      lesson.destroy()
    end
    Student.all().each() do |student|
      student.destroy()
    end
    Feedback.all().each() do |feedback|
      feedback.destroy()
    end
  end
end

@test_student_1 = Student.create({name: "Kendra"})
@test_student_2 = Student.create({name: "Lindsay"})
@test_lesson_1 = Lesson.create({name: 'Ruby', objective: 'Learn ruby'})
@test_feedback_1 = Feedback.create({student_id: test_student_1.id, pair_id: test_student_2.id, lesson_id: test_lesson_1.id})

require('capybara/rspec')
Capybara.app = Sinatra::Application
set(:show_exceptions, false)
require('./app')
