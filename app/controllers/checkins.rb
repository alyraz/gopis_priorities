post '/checkins/new' do
  checkin = Checkin.new params
  redirect "/checkins/#{checkin.id}"
end

get "/checkins/:id" do
  @checkin = Checkin.find(params[:id]) 
  erb :checkin_display
end 
