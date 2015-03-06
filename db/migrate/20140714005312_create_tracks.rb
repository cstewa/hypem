class CreateTracks < ActiveRecord::Migration
  def change
    create_table :tracks do |t|
      t.string :url
      t.integer :playlist_id
      t.string :title
      t.string :artist
      t.string :blog

      t.timestamps
    end
  end
end
