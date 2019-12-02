class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :get_category_id,                if: :user_signed_in?
  before_action :get_recipe,                     if: :user_signed_in?
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :search_recipes,                 if: :user_signed_in?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end

  def after_sign_in_path_for(resource)
    recipes_path
  end

  def after_sign_out_path_for(resource)
    root_path
  end

  def get_category_id
    get_recipe
    @id_categories   = []
    # current_userが作ったカテゴリーを配列に格納
    @recipes.each do |recipe|
      category = recipe.category_frees
      if category.present?
        @categories  = category.pluck(:id)
      end
      @id_caeigories = @id_categories.push(@categories).flatten!
    end
    @id_categories   = @id_categories.uniq
    get_category(@id_caeigories)
  end

  def get_category(ids)
    @all_categories  = CategoryFree.where(id: ids)
  end

  def get_recipe
    @recipes = current_user.recipes.all
  end

  def search_recipes
    @q              = @recipes.ransack(params[:q])
    @search_recipes = @q.result(distinct: true)
  end
end
