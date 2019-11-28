class CategoryFreesController < ApplicationController
  before_action :search_criteria, only: [:random, :result]

  def index
    @menu_categories    = Recipe.menu1_categories.to_a
    @cuisine_categories = Recipe.cuisine_categories.to_a 
  end
  
  def show
    # フリータグの一覧
    @category         = RecipeCategory.where(category_free_id: params[:id])
    @category_name    = CategoryFree.find(params[:id])
  end
  
  def menu_category
    @menu_category    = Recipe.menu1_categories.keys[params[:id].to_i - 1]
    @menu_recipes     = @recipes.where(menu1_category: params[:id].to_i).or(Recipe.where(menu2_category: params[:id].to_i))
  end

  def cuisine_category
    @cuisine_category = Recipe.cuisine_categories.keys[params[:id].to_i - 1]
    @cuisine_recipes  = @recipes.where(cuisine_category: params[:id])
  end

  def random
    @result = @result.order("RAND()").first
  end

  def search
  end

  def result
  end

  private

  def search_params
    params.permit(:menu1_category, :cuisine_category, :name)
  end

  def search_criteria
    recipes_result  = @recipes
    # メニューカテゴリを検索
    recipes_result  = recipes_result.where(menu1_category: search_params[:menu1_category]).or(recipes_result.where(menu2_category: search_params[:menu1_category])) if search_params[:menu1_category].present?
    # 料理ジャンルカテゴリを検索
    recipes_result  = recipes_result.where(cuisine_category: search_params[:cuisine_category]) if search_params[:cuisine_category].present?
    # フリーカテゴリを検索
    category_result = CategoryFree.where(name: search_params[:name]) if search_params[:name].present?
    if category_result.present? && recipes_result.present?
      @result       = RecipeCategory.where(recipe_id: recipes_result).where(category_free: category_result)
    elsif category_result.nil?
      @result       = RecipeCategory.where(recipe_id: recipes_result).select(:recipe_id).distinct
    else
      @result       = RecipeCategory.where(category_free_id: category_result)
    end
  end
end
