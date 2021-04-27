class TopicPostsController < ApplicationController

  def search
    if params[:body].present?
      @TopicPosts = TopicPost.where('body LIKE ?', "%#{params[:body]}%")
    else
      @TopicPosts = TopicPost.none
    end
  end

  def create
    topic = Topic.find(params[:topic_id])
    topic_post = current_user.topic_posts.new(topic_post_params)
    topic_post.topic_id = topic.id
    topic_post.save
    redirect_to topic_path(params[:topic_id])
  end

  def destroy
    TopicPost.find_by(id: params[:id], topic_id: params[:topic_id]).destroy
    redirect_to topic_path(params[:topic_id])
  end

  private

  def topic_post_params
    params.require(:topic_post).permit(:body, :postname, :topic_id)
  end

end
