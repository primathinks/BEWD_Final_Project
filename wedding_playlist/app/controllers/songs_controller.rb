class SongsController < ApplicationController
  def index
    if params[:q]
      @query = params[:q]
    end
    @results = ITunesSearchAPI.search(:term => @query, :country => "US", :media => "music", :limit => 20)
  end

  def show
    @song = Song.find params[:id]
  end

  def create
    @song = Song.new(song_params)
  	if @song.save
  		redirect_to @song
  	else
  		redirect_to songs_path
      flash[:notice] = "Oops, song cannot be displayed. Try again."
  	end
  end

  private
  def song_params
    params.permit(:external_id, :name, :artist, :album, :duration, :thumb100, :thumb60, :itunes, :audio)
  end

end
