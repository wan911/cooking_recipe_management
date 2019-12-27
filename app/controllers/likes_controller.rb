class LikesController < ApplicationController
  before_action :set_id
  before_action :set_recipe

  def create
    Like.create(recipe_id: params[:recipe_id], user_id: current_user.id)
    # redirect_back(fallback_location: recipes_path(params[:recipe_id]))
  end

  def destroy
    like = Like.find_by(recipe_id: params[:recipe_id], user_id: current_user.id)
    like.destroy
    # redirect_back(fallback_location: recipes_path(params[:recipe_id]))
  end

  private

  def set_id
    @recipe  = Recipe.find(params[:recipe_id])
    @id_name = "#like-link-#{@recipe.id}"
  end

  def set_recipe
    recipe = Recipe.find(params[:recipe_id])
  end
end
