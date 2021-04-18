class FigureCommentsController < ApplicationController

  def create
    figure = Figure.find(params[:figure_id])
    comment = current_user.figure_comments.new(figure_comment_params)
    comment.figure_id = figure.id
    comment.save
    redirect_to figure_path(params[:figure_id])
  end

  def destroy
    FigureComment.find_by(id: params[:id], figure_id: params[:figure_id]).destroy
    redirect_to figure_path(params[:figure_id])
  end

  private

  def figure_comment_params
    params.require(:figure_comment).permit(:comment)
  end
end
