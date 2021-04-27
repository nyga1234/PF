class Topic < ApplicationRecord
  has_many :topic_posts, dependent: :destroy
  belongs_to :user
end
