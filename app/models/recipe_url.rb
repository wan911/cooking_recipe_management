class RecipeUrl < ApplicationRecord
  belongs_to :recipe
  validates :recipe_url, presence: true
end
