class ChangeColumnSongid < ActiveRecord::Migration
  def change
  	rename_column :songs, :lastfm_id, :external_id
  end
end
