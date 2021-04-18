class FiguresController < ApplicationController

  def new
    @figure = Figure.new
  end

  def create
    @figure = Figure.new(figure_params)
    @figure.user_id = current_user.id
    @figure.save
    redirect_to figure_path(@figure.id)
  end

  def index
    @figures = Figure.page(params[:page]).reverse_order
  end

  def show
    @figure = Figure.find(params[:id])
    @figure_comment = FigureComment.new
  end

  def destroy
    @figure = Figure.find(params[:id])
    @figure.destroy
    redirect_to figures_path
  end

  private

  def figure_params
    params.require(:figure).permit(:title, :figure_image, :description)
  end
end
