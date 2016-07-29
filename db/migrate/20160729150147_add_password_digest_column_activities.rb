class AddPasswordDigestColumnActivities < ActiveRecord::Migration[5.0]
  def change
    add_column :activities, :password_digest, :string
  end
end
