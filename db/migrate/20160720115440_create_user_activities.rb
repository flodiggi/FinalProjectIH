class CreateUserActivities < ActiveRecord::Migration[5.0]
  def change
    create_table :user_activities do |t|
      t.references :user, index: true
      t.references :activity, index: true
      t.timestamps
    end
  end
end
