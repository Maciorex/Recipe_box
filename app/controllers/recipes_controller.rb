class RecipesController < ApplicationController
  before_action :find_recipe, only: [:show, :edit, :update, :destroy]
  def index
    @recipes = Recipe.all.order("created_at DESC")
  end

  def show; end

  def new
    @recipe = Recipe.new
  end

  def create
    @recipe = Recipe.new(recipes_params)
    if @recipe.save
      redirect_to root_path, notice: "Recipe saved"
    else
      render "new", notice: "Something is wrong"
    end
  end

  def edit; end

  def update
    if @recipe.update(recipes_params)
      redirect_to recipe_path(@recipe), notice: "Recipe updated"
    else
      render "edit", notice: "Error in form"
    end
  end

  def destroy
    @recipe.destroy
    redirect_to root_path, notice: "Recipe deleted"
  end

  private
  def recipes_params
    params.require(:recipe).permit(:title, :description)
  end

  def find_recipe
    @recipe = Recipe.find(params[:id])
  end

end
