class Ingredient < ApplicationRecord
  has_one  :Ingredient_amount
  validates :ingredient, presence: true
end
