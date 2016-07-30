class CreateHosts < ActiveRecord::Migration[5.0]
  def change
    create_table :hosts do |t|
      t.integer :userid
      t.references :activity, foreign_key: true

      t.timestamps
    end
  end
end
