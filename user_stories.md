BEWD: FINAL PROJECT
-------------------

#PROJECT NAME
I Do! Playlist Maker
by: Prima Prasertrat


#USER STORIES
1. As a bride/groom, I can invite friends to participate.
2. As a bride/groom, I can search for songs and add them to a playlist.
3. As a wedding guest, I can search for songs and add them to a playlist.
4. As a wedding guest, I can vote on songs from a playlist.
5. As a bride/groom, I can view voting results.


#MODELS
User  
-first_name:string  
-last_name:string  
-email:string  
-rsvp:boolean

Playlist  
-voter_id:integer  
-type:string

Song  
-name:string  
-artist:string  
-album:string

SongsToPlaylist  
-playlist_id:integer  
-song_id:integer


#ASSOCIATIONS
User has_many :playlists

Playlist belongs_to :voter  
Playlist has_many :songstoplaylists  
Playlist has_many :songs, through songstoplaylists

Song has_many :songstoplaylists  
Song has_many :playlists, through songstoplaylists

SongsToPlaylist belongs_to :playlist  
SongsToPlaylist belongs_to :song


