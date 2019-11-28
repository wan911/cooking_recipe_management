class RecipeAmount < ApplicationRecord
  belongs_to :recipe
  belongs_to :amount
end
