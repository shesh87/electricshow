class CreateSongkickArtists < ActiveRecord::Migration
  def change
    create_table :songkick_artists do |t|
    	t.string :name
      t.timestamps null: false
    end
  end
end
