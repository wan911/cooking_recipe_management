class RecipeUrlsController < ApplicationController
  def create
    @recipe_url = RecipeUrl.new(recipe_url_params)
    if @recipe_url.save
      flash[:notice] = "保存しました"
      redirect_to edit_recipe_path(params[:recipe_id])
    else
      flash[:alert] = "urlを入力してください"
      redirect_to edit_recipe_path(params[:recipe_id])
    end
  end

  def destroy
    @recipe_url = RecipeUrl.find(params[:id])
    @recipe_url.destroy
    redirect_to edit_recipe_path(params[:recipe_id])
  end

  private

  def recipe_url_params
    params.require(:recipe_url).permit(:recipe_url).merge(recipe_id: params[:recipe_id])
  end
end