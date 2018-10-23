require 'sinatra'
require 'pg'

require 'sinatra/reloader' 
require 'pry'

require_relative 'db_config'
require_relative 'models/user'

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
