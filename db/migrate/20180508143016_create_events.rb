class CreateEvents < ActiveRecord::Migration[5.2]
  def change
    create_table :events do |t|
      t.text :description
      t.datetime :date
      t.string :place

      # Pour la relation creator avec User :
      t.integer :creator_id
      t.timestamps
    end

    create_table :attendees_attended_events, id: false do |t|
      t.belongs_to :attendee, index: true
      t.belongs_to :attended_event, index: true
    end

  end
end
