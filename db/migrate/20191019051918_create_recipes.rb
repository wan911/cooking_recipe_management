class CreateRecipes < ActiveRecord::Migration[5.2]
  def change
    create_table :recipes do |t|
      t.string     :title,    null: false, index: true, unique: true
      t.text       :content
      t.string     :image
      t.string     :serving
      t.integer    :menu_category1,    null: false
      t.integer    :menu_category2
      t.integer    :cuisine_category,  null: false
      t.references :user,     null: false, foreign_key: true
      t.timestamps
    end
  end
end
