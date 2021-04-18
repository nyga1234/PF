class Figure < ApplicationRecord

  belongs_to :user
  attachment :figure_image
  has_many :figure_comments, dependent: :destroy
  has_many :favorites, dependent: :destroy

  def favorited_by?(user)
    favorites.where(user_id: user.id).exists?
  end
end
