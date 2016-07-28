class CreateDateVotes < ActiveRecord::Migration[5.0]
  def change
    create_table :date_votes do |t|
      t.boolean :check
      t.references :activity, foreign_key: true
      t.references :user, foreign_key: true
      t.references :date_entry, foreign_key: true

      t.timestamps
    end
  end
end
