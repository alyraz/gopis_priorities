helpers do 

  def oauth_client 
    client = OAuth2::Client.new(
      GOOGLE_CLIENT_ID,
      GOOGLE_CLIENT_SECRET,
      :authorize_url => '/o/oauth2/auth',
      :token_url => '/o/oauth2/token',
      :site => 'https://accounts.google.com/o/oauth2/auth')
  end 

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]  
  end

  def login(id) 
    session[:user_id] = id 
  end

  def logout
    session.delete(:user_id)
  end
end 
