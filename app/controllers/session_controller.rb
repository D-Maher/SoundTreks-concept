# gets the webpage that has the login form
get '/session/new' do

end
  

# authenticates credentials against database, i.e. where the login form posts to
post '/session' do

end


# destroys session and redirect to 
delete '/session' do
  session.delete(:user_id)

  redirect
end

