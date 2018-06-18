class ApplicationController < ActionController::Base
  before_action :authenticate_user!, except: [:index]

  def favorite_text
    @favorite_exists ? "Delete from favorites" : "Add to favorites"
  end

  helper_method :favorite_text
end
