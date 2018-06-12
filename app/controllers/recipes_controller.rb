class RecipesController < ApplicationController
  before_action :find_recipe, only: [:show, :edit, :update, :destroy]
  def index
    @recipes = Recipe.all
  end

  def show

  end

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

  end

  def destroy

  end

  private
  def recipes_params
    params.require(:recipe).permit(:title, :description)
  end

  def find_recipe
    @recipe = Recipe.find(params[:id])
  end

end
