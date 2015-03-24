class AddCategoryToYoutubelist < ActiveRecord::Migration
  def change
    add_column :youtubelists, :category, :string
  end
end
