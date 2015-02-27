class JoinEventsArtists < ActiveRecord::Migration
  def change
  	create_table :join_events_artists, :id => false do |t|
      t.belongs_to :event, index: true
      t.belongs_to :artist, index: true
     end
  end
end
