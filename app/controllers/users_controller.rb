#  gets the webpage that has the registration form
get '/users/new' do
  erb :'/users/new'
end


# records the entered information into database as a new /user/xxx
post '/users' do
  @user = User.new(params[:user])
  if @user.save
    set_session(@user)
    redirect '/'
  else
    @errors = @user.errors.full_messages
    erb :'/users/new'
  end
end


# gets and renders current user data in a profile view
get '/users/:id' do

end


# updates new information about user
put '/users/:id' do

end
