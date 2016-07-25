class CreateActivities < ActiveRecord::Migration[5.0]
  def change
    create_table :activities do |t|
      t.string :name
      t.string :location
      t.string :description
      t.string :category
      t.datetime :starts_at
      t.datetime :ends_at

      t.timestamps
    end
  end
end
