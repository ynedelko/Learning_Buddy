require("bundler/setup")
Bundler.require(:default)
require('pry')

Dir[File.dirname(__FILE__) + '/lib/*.rb'].each { |file| require file }

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

get('/students/:id') do
    @student = Student.find(params.fetch("id").to_i)
    erb(:teacher_student_details)
end

patch('/students/:id') do
    @student = Student.find(params.fetch("id").to_i)
    new_name = params.fetch("name")
    @student.update({:name => new_name})
    erb(:teacher_student_details)
end

delete('/students/:id') do
    @student = Student.find(params.fetch("id").to_i)
    @student.destroy
    redirect('/teacher-admin/')
end

post("/lessons/new") do
    new_lesson = params.fetch("lesson_name")
    Lesson.create({:name => new_lesson})
    redirect('/teacher-admin/')
end

get('/lessons/:id') do
    @lesson = Lesson.find(params.fetch("id").to_i)
    erb(:teacher_lesson_details)
end

patch('/lessons/:id') do
    @lesson = Lesson.find(params.fetch("id").to_i)
    new_name = params.fetch("name")
    @lesson.update({:name => new_name})
    erb(:teacher_lesson_details)
end

delete('/lessons/:id') do
    @lesson = Lesson.find(params.fetch("id").to_i)
    @lesson.destroy
    redirect('/teacher-admin/')
end

###########
get('/teacher-analytics') do
    @lessons = Lesson.all



    @feedback = Feedback.all
    erb(:teacher_analytics)
end

post('/analytics/lessons') do
    @lessons = Lesson.all()
    @lesson = Lesson.find(params['lesson_id'].to_i)
    erb(:teacher_analytics)
end
###########

post('/students') do
  @student = Student.find(params['student_id'].to_i)
  pair = Student.find(params['pair_id'].to_i)
  lesson = Lesson.find(params['lesson_id'].to_i)
  @feedback = Feedback.create({student_id: @student.id, pair_id: pair.id, lesson_id: lesson.id})
  erb(:feedback)
end

get('/feedbacks/:id/students/:id/sad') do
  @feedback = Feedback.find(params['id'].to_i)
  @student = Student.find(params['id'].to_i)
  @feedback.update({mood: 1})
  erb(:feedback_sad)
end


get('/feedbacks/:id/students/:id/neutral') do
  @feedback = Feedback.find(params['id'].to_i)
  @student = Student.find(params['id'].to_i)
  @feedback.update({mood: 2})
  erb(:feedback_neutral)
end


get('/feedbacks/:id/students/:id/happy') do
  @feedback = Feedback.find(params['id'].to_i)
  @student = Student.find(params['id'].to_i)
  @feedback.update({mood: 3})
  erb(:feedback_happy)
end

post('/feedback_mood/:id/students/:id') do
  @feedback = Feedback.find(params['id'].to_i)
  @student = Student.find(params['id'].to_i)
  curriculum = params['Curriculum']
  pair = params['Pair']
  life = params['Life']
  @feedback.update({mood_cause: [curriculum, pair, life]})
  erb(:comment)
end

get('/feedback_final') do
  erb(:feedback_final)
end

post('/feeback_final') do
  @feedback = Feedback.find(params['id'].to_i)
  comment = params['comment']
  @feedback.update({comment: comment})
  erb(:feedback_final)
end
