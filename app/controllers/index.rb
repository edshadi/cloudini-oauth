get '/' do
  erb :index
end
get '/linked_in' do
  redirect LinkedIn.authorization_url
end

get '/oauth' do
  access_token = LinkedIn.get_access_token(params["code"])
  puts access_token
  redirect '/'
end
