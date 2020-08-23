class CreateEnvelopes < ActiveRecord::Migration[6.0]
  def change
    create_table :envelopes do |t|
      t.integer :character_id
      t.integer :weapon_id
      t.integer :room_id
      t.datetime :murder_start_time
      t.datetime :murder_end_time
      t.timestamps
    end
  end
end
