class Figure < ApplicationRecord

  belongs_to :user
  attachment :figure_image
  has_many :figure_comments, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :tags, dependent: :destroy

  validates :figure_image, presence: true
  validates :title, presence: true
  validates :description, presence: true

  def favorited_by?(user)
    favorites.where(user_id: user.id).exists?
  end
end
