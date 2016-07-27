class AddFacebookAttributesToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :age_range, :string
    add_column :users, :link, :string
    add_column :users, :picture, :string
    add_column :users, :locale, :string
    add_column :users, :gender, :string
  end
end
