class CreateLocationEntries < ActiveRecord::Migration[5.0]
  def change
    create_table :location_entries do |t|
      t.string :location
      t.integer :votes, :default => 0
      t.references :activity, index: true

      t.timestamps
    end
  end
end
