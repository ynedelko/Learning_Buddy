require("bundler/setup")
Bundler.require(:default)
require('./lib/feedback')
require('./lib/lesson')
require('./lib/student')
require('pry')

get('/') do
  erb(:index)
end

get('/students') do
  @students = Student.all
  @lessons = Lesson.all
  erb(:students)
end

get('/teachers') do
  erb(:teachers)
end
