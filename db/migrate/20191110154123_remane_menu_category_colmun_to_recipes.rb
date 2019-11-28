class RemaneMenuCategoryColmunToRecipes < ActiveRecord::Migration[5.2]
  def change
    rename_column :recipes, :menu_category1, :menu1_category
    rename_column :recipes, :menu_category2, :menu2_category
  end
end
