class TopicsController < ApplicationController

  def search
    if params[:topicstitle].present?
      @topics = Topic.where('topicstitle LIKE ?', "%#{params[:topicstitle]}%")
    else
      @topics = Topic.none
    end
  end

  def search_show
    if params[:body].present?
      @topic_posts = TopicPost.where('body LIKE ?', "%#{params[:body]}%")
    else
      @topic_posts = TopicPost.none
    end
  end

  def new
    @topic = Topic.new
  end

  def create
    @topic = Topic.new(topic_params)
    @topic.user_id = current_user.id
    if @topic.save
      redirect_to topics_path
    else
      render :index
    end
  end

  def index
    @topics = Topic.all.page(params[:page]).per(10)
    @newtopic = Topic.new
  end

  def show
    @topic = Topic.find(params[:id])
    @topic_posts = TopicPost.where(topic_id: params[:id]).page(params[:page]).per(10)
    #$@topic_postspage = TopicPost.page(params[:page]).reverse_order
    @topic_postnew = TopicPost.new
  end

  def edit
    @topic = Topic.find(params[:id])
  end

  def update
    @topic = Topic.find(params[:id])
    @topic.update(topic_params)
    redirect_to topics_path(@topic.id)
  end

  def destroy
    @topic = Topic.find(params[:id])
    @topic.destroy
    redirect_to topics_path
  end

   private
  # ストロングパラメータ
  def topic_params
    params.require(:topic).permit(:topicstitle)
  end

end
