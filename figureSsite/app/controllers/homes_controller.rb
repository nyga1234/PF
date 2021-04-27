class HomesController < ApplicationController
  def top
  	@figures = Figure.where("created_at >= ?", Date.today)
  	@count = @figures.count
  end

end
