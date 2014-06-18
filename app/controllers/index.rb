get '/' do
  erb :index
end

get '/linked_in' do
  redirect LinkedIn.authorization_url
end

get '/oauth' do
  access_token = LinkedIn.get_access_token(params["code"])
  user = User.create_from_linked_in access_token
  redirect "/users/#{user.id}"
end

get '/users/:id' do
  @user = User.find params[:id]
  erb :'users/show'
end
