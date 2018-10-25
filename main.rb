require 'sinatra'
require 'pg'

require 'sinatra/reloader' 
require 'pry'

require_relative 'db_config'

require_relative 'models/user'
require_relative 'models/groupactivity'
require_relative 'models/attendingactivity'

enable :sessions

helpers do
  def logged_in?
    if current_user
      return true
    else
      return false
    end
  end
  
  def current_user
    User.find_by(id:session[:user_id])
  end
end

get '/' do
  @activity = GroupActivity.all
  erb :index

end

get '/login' do
  erb :login
end

post '/session' do
  user = User.find_by(email: params[:email])
  if user && user.authenticate(params[:password])
    session[:user_id] = user.id
    redirect to('/')
  else
    # try again
  end
  redirect to('/')
end

delete '/session' do
  session[:user_id] = nil
  redirect to ('/')
end

get '/signup' do
  erb :signup
end

post '/signup' do
  user = User.new
  user.first_name= params[:firstname]
  user.last_name= params[:lastname]
  user.email= params[:email]
  user.password= params[:password]
  user.save

  session[:user_id] = user.id

  redirect '/'
end

post '/activity' do
  erb :activity
end

post '/activity/new' do
  if logged_in?
    activity = GroupActivity.new
    activity.activity_organiser=session[:user_id]
    activity.start_time = params[:starttime]
    activity.end_time = params[:endtime]
    activity.location = params[:location]
    activity.save
    redirect '/'
  else
    redirect '/signup'
  end
end

post '/event/attending' do
  if logged_in?
    activity = AttendingActivity.new
    activity.group_activity_id = params[:activity_id]
    activity.user_id = current_user.id
    activity.save
    redirect '/'
  else
    redirect '/signup'
  end
end