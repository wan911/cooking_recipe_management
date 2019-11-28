class CreateRecipeUrls < ActiveRecord::Migration[5.2]
  def change
    create_table :recipe_urls do |t|
      t.string     :recipe_url
      t.references :recipe,     null: false, foreign_key: true
      t.timestamps
    end
  end
end
