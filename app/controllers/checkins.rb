post '/checkins/new' do
  content_type :json
  p params
  #currently creating checkin w/o ID. Set up Google oAuth first. 
  checkin = Checkin.new params
  #TODO -- validations. Do it. 
  checkin.save
  (checkin.id).to_json 
  #redirect "/checkins/#{checkin.id}"
end

get "/checkins/:id" do
  @checkin = Checkin.find(params[:id]) 
  erb :checkin_display
end 
