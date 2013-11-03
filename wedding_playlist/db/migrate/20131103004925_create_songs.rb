class CreateSongs < ActiveRecord::Migration
  def change
    create_table :songs do |t|
      t.integer :lastfm_id
      t.string :name
      t.string :artist
      t.string :album

      t.timestamps
    end
  end
end
