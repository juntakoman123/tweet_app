class UsersController < ApplicationController
  before_action :authenticate_user,{only: [:index,:show,:edit,:update]}
  before_action :forbid_login_user,{only: [:new,:create,:login_form,:login]}
  before_action :ensure_correct_user, {only: [:edit, :update]}

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
      @user = User.new(name: params[:name],email: params[:email],
        image_name: "default.JPG",password: params[:password])
      if @user.save
        session[:user_id] = @user.id#新規登録時にログインをする
        flash[:notice] = "ユーザー登録が完了しました"
        redirect_to("/users/#{@user.id}")
      else
        render("users/new")
      end
    end

    def edit
      @user = User.find_by(id: params[:id])
    end

    def update
      @user = User.find_by(id: params[:id])
      @user.name = params[:name]
      @user.email = params[:email]
      if params[:image]
        @user.image_name = "#{@user.id}.jpg"
        image = params[:image]
        File.binwrite("public/users_image/#{@user.image_name}",image.read)#画像ファイルなのでbinwriteメソッドで書き込む
      end

      if @user.save
        flash[:notice] = "ユーザー情報を編集しました"
        redirect_to("/users/#{@user.id}")
      else
        render("users/edit")
      end
    end

    def login_form

    end

    def login
      @user = User.find_by(email: params[:email])
      if @user && @user.authenticate(params[:password])
        session[:user_id] = @user.id
        flash[:notice] = "ログインしました"
        redirect_to("/posts/index")
      else
        @error_message = "メールアドレスまたはパスワードが間違っています"
        @email = params[:email]
        @password = params[:password]
        render("users/login_form")
      end
    end

    def  logout
      session[:user_id] = nil
      flash[:notice] = "ログアウトしました"
      redirect_to("/login")
    end

    def likes
      @user = User.find_by(id: params[:id])
      @likes = Like.where(user_id: @user.id)
    end
  end
