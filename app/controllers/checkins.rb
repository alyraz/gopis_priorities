post '/checkins' do
  content_type :json
  checkin = Checkin.create params #currently no user (google oAuth first)
  #TODO -- validations. Do it.
  (checkin.id).to_json #write json to override this and return ID only 
end

get "/checkins/:id" do
  @checkin = Checkin.find(params[:id]) 
  erb :checkin_display
end 
