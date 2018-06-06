require( 'sinatra' )
require( 'sinatra/contrib/all' )
require( 'pry-byebug' )
require_relative('./models/student')
also_reload('./models/*')

get '/' do
  erb(:home)
end

get '/students' do
  @students = Student.all()
  erb(:index)
end

get '/students/new' do
  @houses = House.all()
  erb(:new)
end

get '/students/:id' do
  @houses = House.all()
  @student = Student.find(params[:id])
  erb(:show)
end

get '/students/:id/edit' do
  @houses = House.all()
  @student = Student.find(params[:id])
  erb(:edit)
end

post '/students/:id' do # update
  # new student details
  updated_student = Student.new(params)
  # sends new details to database
  updated_student.update()
  redirect to '/students'
end

post '/students' do
  @student= Student.new(params)
  @student.save()
  redirect to '/students'
end

post '/students/:id/delete' do
  id = params["id"].to_i
  @student = Student.find(id)
  # binding.pry
  @student.delete()
  redirect to '/students'
end
