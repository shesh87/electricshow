class CreateEventsArtists < ActiveRecord::Migration
  def change
    create_table :events_artists do |t|
      t.belongs_to :event, index: true
      t.belongs_to :artist, index: true
      t.timestamps null: false
    end
  end
end
