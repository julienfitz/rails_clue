class CreateGuestbookEntries < ActiveRecord::Migration[6.0]
  def change
    create_table :guestbook_entries do |t|
      t.datetime :time_entered
      t.datetime :time_exited
      t.integer :character_id
      t.integer :room_id
      t.timestamps
    end
  end
end
