class FavoritesController < ApplicationController
  def update
    favorite = Favorite.where(recipe: Recipe.find(params[:recipe]), user: current_user)
    if favorite.empty?
      Favorite.create(recipe: Recipe.find(params[:recipe]), user: current_user)
      @favorite_exists = true
    else
      favorite.destroy_all
      @favorite_exists = false
    end
    respond_to do |format|
      format.html {}
      format.js {}
    end
  end

  def show
    @favorites = Favorite.where(user: current_user)
  end
end
