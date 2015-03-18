class CreateYoutubelists < ActiveRecord::Migration
  def change
    create_table :youtubelists do |t|
      t.string :url
      t.references :user, index: true

      t.timestamps null: false
    end
    add_foreign_key :youtubelists, :users
  end
end
