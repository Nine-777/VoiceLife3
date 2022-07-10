class CommentsController < ApplicationController
    def create
      @comment = current_user.comments.new(comment_params)
      if @comment.save
        redirect_back(fallback_location: root_path)
      else
        redirect_back(fallback_location: root_path)
      end
  
    end

    def destroy
      @comment = Comment.find_by(id: params[:id])
      @comment.destroy
      flash[:notice] = "投稿を削除しました"
      redirect_to posts_path
    end
  
    private
    def comment_params
      params.require(:comment).permit(:comment, :post_id)
    end
  end