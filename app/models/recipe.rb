class Recipe < ApplicationRecord
  mount_uploader :image, ImageUploader
  validates  :title,              presence: true
  validates  :menu1_category,     presence: true
  validates  :cuisine_category,   presence: true

  has_many   :recipe_categories,  dependent: :destroy
  has_many   :category_frees,     through: :recipe_categories
  belongs_to :user
  has_many   :recipe_urls,        dependent: :destroy
  has_many   :ingredient_amounts, dependent: :destroy
  has_one    :like

  enum menu1_category: {
    "主食":1,"主菜":2,"副菜":3,"汁物":4,"デザート":5
  },_suffix: true

  enum menu2_category: {
    "主食":1,"主菜":2,"副菜":3,"汁物":4,"デザート":5
  },_suffix: true

  enum cuisine_category: {
    "和食":1,"中華":2,"洋食":3,"その他":4
  } 
end