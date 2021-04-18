class FigureComment < ApplicationRecord

  belongs_to :user
  belongs_to :figure
end
