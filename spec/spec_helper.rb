ENV['RACK_ENV'] = 'test'

require("bundler/setup")
Bundler.require(:default, :test)
set(:root, Dir.pwd())

require("lesson")
require("student")


RSpec.configure do |config|
  config.after(:each) do
    Lesson.all().each() do |lesson|
      lesson.destroy()
    end
    Student.all().each() do |student|
      student.destroy()
    end
  end
end

# require('capybara/rspec')
# Capybara.app = Sinatra::Application
# set(:show_exceptions, false)
# require('./app')
