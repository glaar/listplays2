class AddCategoryToUsers < ActiveRecord::Migration
  def change
    add_column :users, :categories, :string
  end
end
