class CreateSoundTreks < ActiveRecord::Migration
  def change
    create_table :sound_treks do |t|
      t.integer :location_id, null: false
      t.integer :playlist_id, null: false
      t.float :radius, null: false

      t.timestamps(null: false)
    end
  end
end
