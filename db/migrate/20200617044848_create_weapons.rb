class CreateWeapons < ActiveRecord::Migration[6.0]
  def change
    create_table :weapons do |t|
      t.string :name
      t.integer :envelope_id
      t.integer :character_id
      t.timestamps
    end
  end
end
