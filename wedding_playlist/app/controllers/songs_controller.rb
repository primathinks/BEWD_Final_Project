class SongsController < ApplicationController
  def index
    if params[:q]
      @query = params[:q]
    end
    @results = ITunesSearchAPI.search(:term => @query, :country => "US", :media => "music", :limit => 20)
  end

  def create
    @song = Song.new(song_params)
  	if @song.save
  		redirect_to songs_path
      flash[:notice] = "Song successfully created"
  	else
  		redirect_to songs_path
      flash[:notice] = "Song failed"
  	end
  end

  private
  def song_params
    params.permit(:external_id, :name, :artist, :album)
  end

end
