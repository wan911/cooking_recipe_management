class CreateRecipeCategories < ActiveRecord::Migration[5.2]
  def change
    create_table :recipe_categories do |t|
      t.references :recipe,           null: false, foreign_key: true
      t.references :category_free,         null: false, foreign_key: true
      t.timestamps
    end
  end
end
