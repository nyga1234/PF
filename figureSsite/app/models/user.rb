class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :figures, dependent: :destroy
  has_many :figure_comments, dependent: :destroy
  has_many :favorites, dependent: :destroy

         attachment :profile_image
end
