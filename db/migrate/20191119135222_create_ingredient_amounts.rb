class CreateIngredientAmounts < ActiveRecord::Migration[5.2]
  def change
    create_table :ingredient_amounts do |t|
      t.references  :ingredient, null: false
      t.integer     :amount_id
      t.references  :recipe,       null: false
      t.timestamps
    end
  end
end
