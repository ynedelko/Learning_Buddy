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
  erb(:teacher_welcome)
end

get('/teacher-admin/') do
    @lessons = Lesson.all
    @students = Student.all
    erb(:teacher_admin)
end

post("/students/new") do
    new_student = params.fetch("name")
    Student.create({:name => new_student})
    redirect('/teacher-admin/')
end

get('/teacher-review/') do
    @lessons = Lesson.all
    erb(:teacher_review)
end
