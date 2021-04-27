class PostsToTopicPosts < ActiveRecord::Migration[5.2]
  def change
  rename_table :posts, :topic_posts
  end
end
