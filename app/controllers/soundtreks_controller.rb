post '/soundtreks' do
  @playlist = Playlist.new(params[:playlist])
  @playlist.creator = current_user

  @location = Location.new(params[:location])

  @soundtrek = SoundTrek.new()
  @soundtrek.location = @location
  @soundtrek.playlist = @playlist

  if request.xhr?
    if @soundtrek.save



    end
  end
end

# we want to cluster locations in the db
