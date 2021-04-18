class FavoritesController < ApplicationController

  def create
    figure = Figure.find(params[:figure_id])
    favorite = current_user.favorites.new(figure_id: figure.id)
    favorite.save
    redirect_to figure_path(params[:figure_id])
  end

  def destroy
    figure = Figure.find(params[:figure_id])
    favorite = current_user.favorites.find_by(figure_id: figure.id)
    favorite.destroy
    redirect_to figure_path(params[:figure_id])
  end

end
