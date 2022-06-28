class HomesController < ApplicationController
  def index

  end

  def create
  end

  def guest_sign_in
    user = User.guest
    redirect_to posts_path
  end

end