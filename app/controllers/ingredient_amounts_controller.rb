class IngredientAmountsController < ApplicationController
  def create
    @ingredient = Ingredient.where(ingredient: ingredient_params[:ingredient]).first_or_initialize
    @amount     = Amount.where(amount: amount_params[:amount]).first_or_initialize
    if @ingredient.save 
      @amount.save
      @ingredient_amount = IngredientAmount.create(
        recipe_id:     recipe_params[:recipe_id],
        ingredient_id: @ingredient.id,
        amount_id:     @amount.id
      )
      flash[:notice] = "材料を追加しました"
      redirect_to edit_recipe_path(params[:recipe_id])
    else
      flash[:alert] = "材料名を入力してください"
      redirect_to edit_recipe_path(params[:recipe_id])
    end
  end

  def destroy
    @ingredient = IngredientAmount.find(params[:id])
    @ingredient.destroy
    redirect_to edit_recipe_path(params[:recipe_id])
  end

  private

  def ingredient_params
    params.require(:ingredient).permit(:ingredient)
  end

  def amount_params
    params.require(:amount).permit(:amount)
  end

  def recipe_params
    params.permit(:recipe_id)
  end
end
