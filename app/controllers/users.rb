get '/' do 
  redirect '/home'
end 

get '/home' do 
  erb :home
end 

get '/loginsignup' do
  erb :google_oauth
  #erb :login_signup
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

get '/google/auth' do 
  client = oauth_client
  redirect_uri = client.auth_code.authorize_url(:redirect_uri => 'http://localhost:9292/oauth2callback', :scope => "https://www.googleapis.com/auth/userinfo.profile")
  redirect redirect_uri
end 

get '/oauth2callback' do
  client = oauth_client
  @token = client.auth_code.get_token(params[:code], :redirect_uri => 'http://localhost:9292/oauth2callback')
  response = @token.get('https://www.googleapis.com/oauth2/v1/userinfo', :params => { 'access_token' => @token })
  @user_info = JSON.parse(response.body)
  # now create a user with .name, photo 
 end 



