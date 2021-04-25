class FiguresController < ApplicationController

  def search
    if params[:title].present?
      @figures = Figure.where('title LIKE ?', "%#{params[:title]}%")
    else
      @figures = Figure.none
    end
  end

  def new
    @figure = Figure.new
  end

  def create
    @figure = Figure.new(figure_params)
    @figure.user_id = current_user.id
    if @figure.save
      redirect_to figure_path(@figure.id)
    else
      render :new
    end
  end

  def index
    @figures = Figure.page(params[:page]).reverse_order

  end

  def show
    @figure = Figure.find(params[:id])
    @figure_comment = FigureComment.new
  end

  def edit
    @figure = Figure.find(params[:id])
  end

  def update
    @figure = Figure.find(params[:id])
    @figure.update(figure_params)
    if @figure.save
      redirect_to figure_path(@figure.id)
    else
      render :edit
    end
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
