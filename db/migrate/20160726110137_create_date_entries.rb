class CreateDateEntries < ActiveRecord::Migration[5.0]
  def change
    create_table :date_entries do |t|
      t.date :date
      t.integer :votes
      t.references :activity, index: true


      t.timestamps
    end
  end
end
