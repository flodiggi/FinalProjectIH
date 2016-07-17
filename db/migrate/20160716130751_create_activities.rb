class CreateActivities < ActiveRecord::Migration[5.0]
  def change
    create_table :activities do |t|
      t.string :name
      t.integer :participants
      t.string :groups

      t.timestamps
    end
  end
end
