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
    end
  
    def login_form
    end
  
    def login
      @user = User.find_by(email: params[:email])
      if @user && @user.authenticate(params[:password])
        session[:user_id] = @user.id
        flash[:notice] = "ログインしました"
        redirect_to posts_path
      else
        @error_message = "メールアドレスまたはパスワードが間違っています"
        @email = params[:email]
        @password = params[:password]
        render("users/login_form")
      end
    end
  
    def logout
      session[:user_id] = nil
      flash[:notice] = "ログアウトしました"
      redirect_to("/login")
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