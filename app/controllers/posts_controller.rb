class PostsController < ApplicationController
  before_action :authenticate_user#postアクションが行われるまえにログインしてるかかどうかで分岐する
  before_action :ensure_correct_user2, {only: [:edit, :update,:destroy]}

    def index
      @posts = Post.all.order(created_at: :desc)#降順で並び替えるorderメソッド　
    end

    def show
      @post = Post.find_by(id: params[:id])
      @user = @post.user
      @likes_count = Like.where(post_id: @post.id).count
    end

    def new
      @post = Post.new
    end

    def create
      @post = Post.new(content: params[:content],
      user_id: @current_user.id
      )#name属性で指定したcontent属性の内容をparamsで受け取る
      if @post.save
        flash[:notice] = "投稿を作成しました"
        redirect_to("/posts/index")#リダイレトメソッドend
      else
       render("posts/new")
      end
    end

    def edit
      @post = Post.find_by(id: params[:id])
    end


    def update
      @post = Post.find_by(id: params[:id])
      @post.content = params[:content]
      if @post.save
        flash[:notice] = "投稿を編集しました"
        redirect_to("/posts/index")
      else
        # renderメソッドを用いて、editアクションを経由せず、posts/edit.html.erbが表示されるようにしてください
        render("posts/edit")#直接ルートを使わず
      end
    end

    def destroy
    #form_tagかどうかで　{method: "post"と記述が必要かどうかが変わる}
    @post = Post.find_by(id: params[:id])
    @likes = Like.where(post_id: @post.id)
    @likes.delete_all
    @post.destroy
      flash[:notice] = "投稿を削除しました"
      redirect_to("/posts/index")
    end


    def ensure_correct_user2
      @post = Post.find_by(id: params[:id])
      if @post.user_id != @current_user.id
        flash[:notice] = "権限がありません"
        redirect_to("/posts/index")
      end
    end
  end
