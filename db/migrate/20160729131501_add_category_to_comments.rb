class AddCategoryToComments < ActiveRecord::Migration[5.0]
  def change
    add_column :comments, :category, :string
  end
end
