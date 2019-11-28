class CategoryFree < ApplicationRecord
  has_many :recipe_categores
  has_many :recipes,  through: :recipe_categores
end