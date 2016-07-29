class CreateTimeVotes < ActiveRecord::Migration[5.0]
  def change
    create_table :time_votes do |t|
      t.boolean :check
      t.references :activity, foreign_key: true
      t.references :user, foreign_key: true
      t.references :time_entry, foreign_key: true

      t.timestamps
    end
  end
end
