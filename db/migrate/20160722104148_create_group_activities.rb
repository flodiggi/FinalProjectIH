class CreateGroupActivities < ActiveRecord::Migration[5.0]
  def change
    create_table :group_activities do |t|
      t.references :group, index: true
      t.references :activity, index: true

      t.timestamps
    end
  end
end
