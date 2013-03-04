post '/checkins/new' do
  p data
  checkin = Checkin.new
  redirect "/checkins/#{checkin.id}"
end

get "/checkins/:id" do
  @checkin = Checkin.find(params[:id]) 
  erb :checkin_display
end 
