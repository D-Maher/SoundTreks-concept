helpers do
  def current_user
    @current_user ||= User.find_by(id: session[:user_id]) # if @current_user is undefined, find the user in the database with the id that matches the 'user_id' in the 'session' hash and assign it to @current_user
  end

  def logged_in?
    !!current_user
  end

  def set_session(user)
    session[:user_id] = user.id
  end
end


# NOTES

# Longhand for the '||=' expression in the 'current_user' method above:

  # if @current_user
  #   @current_user
  # else
  #   @current_user = User.find_by(id: session[:user_id])
  #   return @current_user
  # end

  # PSEUDOCODE:

    # if @current_user exists, return @current_user
    # otherwise find the user in the database whose 'id' matches 'session[:user_id]' and return that user as @current_user
