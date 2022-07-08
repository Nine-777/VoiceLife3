class UsersController < ApplicationController

  def index
    @users = User.all
  end
  
  def show
    @user = User.find_by(id: params[:id])
  end
    
  def new
    @user = User.new
  end
  
  def create
    @user = User.new(
      name: params[:name], 
      email: params[:email],
      password: params[:password],
      password_confirmation: params[:password_confirmation],
    )
    if @user.save
      session[:user_id] = @user.id
      redirect_to user_path(@user)
      flash[:notice] = "ユーザー登録が完了しました"
    else
      flash[:error] = "作成に失敗しました"
      render ("users/new")
    end
  end
  
  def edit
    @user = User.find_by(id: params[:id])
  end
  
  def update            
    @user = User.find_by(id: params[:id])            
    @user.name = params[:name]   
    @user.self_introduction = params[:profile]
    @user.avatar = params[:avatar]                  
    @user.email = params[:email]
    if @user.save                        
      redirect_to("/users/#{@user.id}")
      flash[:notice] = "ユーザー情報を編集しました"            
    else            
      render("users/edit")        
    end
  end
  
  def login_form
  end
    
  def likes
    @user = User.find_by(id: params[:id])
    @likes = Like.where(user_id: @user.id)
  end
  
  def ensure_correct_user
    if @current_user.id != params[:id].to_i
      flash[:notice] = "権限がありません"
      redirect_to posts_path
    end
  end

end