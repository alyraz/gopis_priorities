get '/' do 
  redirect '/home'
end 

get '/home' do 
  erb :home
end 

get '/loginsignup' do
  erb :login_signup
end 

post '/signup' do 
  new_user = User.new params 
  #this is where I'll display errors? 
  new_user.save!
  login(new_user.id)
  redirect '/home'
end 

post '/login' do
  user = User.find_by_email(params[:email])
  login(user.id) if user 
  redirect '/home'
end 

get '/users/:id' do
  @user = User.find(params[:id])
  erb :profile 
end 

get '/logout' do 
  logout #does this method need to clear current user as well?
  redirect '/home'
end 


