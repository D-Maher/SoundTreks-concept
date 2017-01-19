class CreatePlaylists < ActiveRecord::Migration
  def change
    create_table :playlists do |t|
      t.string :title, null: false
      t.string :url, null: false
      t.integer :creator_id, null: false

      t.timestamps(null: false)
    end
  end
end
