class RemoveCategoriesFromUsers < ActiveRecord::Migration
  def change
    remove_column :users, :categories, :string
  end
end
