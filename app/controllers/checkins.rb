post '/checkins/new' do
  # checkin = Checkin.new {:user_id => current_user.id}.merge(params)
  redirect "/checkins/#{checkin.id}"
end

get "/checkins/:id" do
  @checkin = Checkin.find(params[:id]) 
  erb :checkin_display
end 
