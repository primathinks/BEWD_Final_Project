class PlaylistsController < ApplicationController
  def index
    @playlists = Playlist.find_all_by_user_id(current_user.id)
  end

  def show
    @playlist = Playlist.find params[:id]
  end

  def new
  	@playlist = Playlist.new
  end

  def create
  	safe_playlist_params = params.require(:playlist).permit(:name)
    @playlist = Playlist.new safe_playlist_params.merge(:user_id => current_user.id)

    if @playlist.save
    	redirect_to @playlist
    else
    	render :new
    end
  end

  
end
