class IngredientAmount < ApplicationRecord
  belongs_to :amount
  belongs_to :ingredient
  belongs_to :recipe
end
