class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
    	t.string :title
    	t.text :description
    	t.date :date
      t.time :time
    	t.string :venue
    	t.string :city
    	t.string :ticket
      t.timestamps null: false
    end
  end
end
