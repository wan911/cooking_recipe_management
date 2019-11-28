class RecipeCategory < ApplicationRecord
  belongs_to :recipe
  belongs_to :category_free
end