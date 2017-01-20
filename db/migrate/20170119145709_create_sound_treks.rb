class CreateSoundTreks < ActiveRecord::Migration
  def change
    create_table :sound_treks do |t|
      t.integer :location_id, null: false
      t.integer :playlist_id, null: false
      t.float :radius, default: 1000.0

      t.timestamps(null: false)
    end
  end
end
