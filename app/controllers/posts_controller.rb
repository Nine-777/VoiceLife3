class PostsController < ApplicationController
  before_action :current_user, {only: [:edit, :update, :destroy]}
 
  def index
    @posts = Post.all.page(params[:page]).per(10).order(created_at: :desc)
    @all_ranks = Post.find(Like.group(:post_id).order('count(post_id) desc').limit(3).pluck(:post_id))
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

  def ensure_correct_user
    @post = Post.find_by(id: params[:id])
    if @post.user_id != @current_user.id
      flash[:notice] = "権限がありません"
      redirect_to posts_path
    end
  end

  def post_params
    params.require(:post).permit(:title, :content).merge(user_id: current_user.id)
  end

  def search
    @posts = Post.search(params[:keyword])
    @keyword = params[:keyword]
    render "index"
  end
  
end