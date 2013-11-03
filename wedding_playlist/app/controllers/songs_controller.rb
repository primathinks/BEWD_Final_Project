class SongsController < ApplicationController
  def index
    if !params[:q].nil?
    @query = params[:q].gsub(" ", "%20") 
  end

  	@spotify = HTTParty.get("http://ws.spotify.com/search/1/track.json?q=#{@query}")

    @results = []

    if @spotify["info"]["num_results"] > 0
      @spotify["tracks"].map do |entry|
          name = entry["name"]
          artist = entry["artists"].last["name"]
          album = entry["album"]["name"]
          date = entry["album"]["released"]
          if entry["album"]["availability"]["territories"].include? "US"
            @results << {name: name, artist: artist, album: album, date: date}
          end
        end

    end

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
