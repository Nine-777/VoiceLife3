class LikesRankingController < ApplicationController
  def index
    @all_ranks = Post.find(Like.group(:post_id).order('count(post_id) desc').limit(7).pluck(:post_id))
  end
end
