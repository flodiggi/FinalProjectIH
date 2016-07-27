class CreateTimeEntries < ActiveRecord::Migration[5.0]
  def change
    create_table :time_entries do |t|
      t.time :time
      t.integer :votes
      t.references :activity, index: true


      t.timestamps
    end
  end
end
