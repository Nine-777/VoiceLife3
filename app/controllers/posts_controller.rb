class PostsController < ApplicationController
  require "open-uri"
  before_action :authenticate_user!
  before_action :ensure_user, only: [:edit, :update, :destroy]
 
  def index
    @posts = Post.all.page(params[:page]).per(10).order(created_at: :desc)
    @all_ranks = Post.find(Like.group(:post_id).order('count(post_id) desc').limit(10).pluck(:post_id))
    api = Rails.application.credentials.news_api[:api_key]
    encoded_str = URI.encode_www_form(q: 'voice')
    uri = URI.parse("https://newsapi.org/v2/everything?#{encoded_str}&sortBy=popularity&pageSize=5&apiKey=#{api}")
    article_serialized = uri.read
    @articles = JSON.parse(article_serialized)
  end

  def show
    @post = Post.find_by(id: params[:id])
    @user = User.find_by(id: @post.user_id)
    @post = Post.find(params[:id])
    @like = Like.new
    @comments = @post.comments
    @comment = current_user.comments.new
    # @likes_count = Like.where(post_id: @post.id).count
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(
      content: params[:post][:content],
      user_id: current_user.id,
      file: params[:post][:file]
    )
    if @post.save
      flash[:notice] = "投稿を作成しました"
      redirect_to posts_path
    else
      render new_post_path
    end
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find_by(id: params[:id])
    @post.content = params[:content]
    if @post.save
      flash[:notice] = "投稿を編集しました"
      redirect_to posts_path
    else
      render("posts/edit")
    end  
  end

  def destroy
    @post = Post.find_by(id: params[:id])
    @post.destroy
    flash[:notice] = "投稿を削除しました"
    redirect_to posts_path
  end

  def post_params
    params.require(:post).permit(:title, :content).merge(user_id: current_user.id)
  end

  def search
    @posts = Post.search(params[:keyword])
    @keyword = params[:keyword]
    render "index"
  end

  private
  def ensure_user
    @posts = current_user.posts
    @post = @posts.find_by(id: params[:id])
    unless @post
      flash[:alert] = "権限がありません"
      redirect_to root_path
    end
  end
  
end