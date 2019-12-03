class RecipesController < ApplicationController
  before_action :set_recipe, only: [:show, :edit, :update, :destroy]
  
  def index
  end

  def search
    @q              = @recipes.ransack(search_params)
    @search_recipes = @q.result(distinct: true)
  end

  def new
    @recipe = Recipe.new
    @category_free = CategoryFree.new
  end

  def create
    @recipe = Recipe.new(recipe_params)
    # 空欄を保存しないようにする
    @recipe_category = category_free_params[:name].reject(&:blank?)
    if @recipe.save
      @recipe_category.each do |category|
        @category = CategoryFree.where(name: category).first_or_create
        RecipeCategory.create(recipe_id: @recipe.id, category_free_id: @category.id)
      end
      flash[:notice] = "レシピを作成しましょう"
      redirect_to edit_recipe_path(@recipe)
    else
      flash.now[:alert] = "必須項目を入力してください"
      render :new
    end
  end

  def show
  end

  def edit
    @amount     = Amount.new
    @ingredient = Ingredient.new
    @recipe_url = RecipeUrl.new
  end

  def update
    if @recipe.update(recipe_params)
      flash[:notice] = "更新しました"
      redirect_to edit_recipe_path(@recipe)
    else
      flash[:alert] = "タイトルがありません"
      redirect_to edit_recipe_path(@recipe)
    end
  end

  def destroy
    @recipe.destroy
    flash[:notice] = "レシピを削除しました"
    redirect_to root_path
  end

  private

  def recipe_params
    params.fetch(:recipe, {}).permit(:title, :image, :content, :menu1_category, :menu2_category, :cuisine_category, :serving ).merge(user_id: current_user.id)
  end

  def category_free_params
    params.require(:category).permit(name: [])
  end

  def set_recipe
    @recipe = Recipe.find(params[:id])
  end

  def search_params
    params.require(:q).permit(:title_cont)
  end
end
