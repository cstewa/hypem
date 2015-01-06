class CreateSongs < ActiveRecord::Migration
  def change
    create_table :songs do |t|
      t.string :url
      t.integer :playlist_id

      t.timestamps
    end
  end
end
