class CreateEnvelopes < ActiveRecord::Migration[6.0]
  def change
    create_table :envelopes do |t|

      t.timestamps
    end
  end
end
