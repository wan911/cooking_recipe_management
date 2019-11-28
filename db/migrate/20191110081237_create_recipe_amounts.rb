class CreateRecipeAmounts < ActiveRecord::Migration[5.2]
  def change
    create_table :recipe_amounts do |t|
      t.references :recipe,           null: false, foreign_key: true
      t.references :amount,         null: false, foreign_key: true
      t.timestamps
    end
  end
end
