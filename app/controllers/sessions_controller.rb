# gets the webpage that has the login form
get '/sessions/new' do
  erb :'/sessions/new'
end


# authenticates credentials against database, i.e. where the login form posts to
post '/sessions' do
  @user = User.authenticate(params[:user][:email], params[:user][:password])
  if @user
    set_session(@user)
    redirect '/'
  else
    @errors = ["Invalid email or password"]
    erb :'/sessions/new'
  end
end


# destroys session and redirect to
delete '/sessions' do
  session.delete(:user_id)

  redirect '/'
end

