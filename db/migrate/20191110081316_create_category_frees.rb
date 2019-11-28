class CreateCategoryFrees < ActiveRecord::Migration[5.2]
  def change
    create_table :category_frees do |t|
      t.string      :name,      null: false, index: true, unique: true
      t.timestamps
    end
  end
end
