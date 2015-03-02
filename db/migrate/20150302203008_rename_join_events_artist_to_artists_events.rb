class RenameJoinEventsArtistToArtistsEvents < ActiveRecord::Migration
  def self.up
    rename_table :join_events_artists, :artists_events
  end 
  def self.down
    rename_table :artists_events, :join_events_artists
  end
end
