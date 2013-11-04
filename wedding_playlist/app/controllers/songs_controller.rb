class SongsController < ApplicationController
  def index
    if params[:q]
      @query = params[:q].gsub(" ", "+") 
    end
    @results = ITunesSearchAPI.search(:term => @query, :country => "US", :media => "music", :limit => 20)
  end

  def create
  	@song = Song.new(:lastfm_id => params[:lastfm_id])
  	if @song.save
  		redirect_to root_path
  	else
  		redirect_to root_path
  	end
  end

end
