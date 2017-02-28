module Homeland::Press
  class PostsController < Homeland::Press::ApplicationController
    before_action :authenticate_user!, only: [:new, :create, :update, :publish, :destroy]
    before_action :set_post, only: [:show, :edit, :update, :publish, :destroy]

    # GET /posts
    def index
      @posts = Post.published.order('published_at desc, id desc').page(params[:page]).per(10)
    end

    def upcoming
      @posts = Post.upcoming.order('id desc').page(params[:page]).per(10)
    end

    # GET /posts/1
    def show
      @post.hits.incr(1)
    end

    def preview
      out = Homeland::Markdown.call(params[:body])
      render plain: out
    end

    # GET /posts/new
    def new
      authorize! :create, Post
      @post = Post.new
    end

    # GET /posts/1/edit
    def edit
      authorize! :update, @post
    end

    # POST /posts
    def create
      authorize! :create, Post
      @post = Post.new(post_params)
      @post.user_id = current_user.id

      if @post.save
        redirect_to @post, notice: '文章提交成功，需要等待管理员审核。'
      else
        render :new
      end
    end

    # PATCH/PUT /posts/1
    def update
      authorize! :update, @post
      if @post.update(post_params)
        redirect_to @post, notice: '文章更新成功。'
      else
        render :edit
      end
    end

    def publish
      authorize! :publish, @post
      @post.published!
      redirect_to posts_path, notice: "文章审核成功。"
    end

    # DELETE /posts/1
    def destroy
      authorize! :destroy, @post
      @post.destroy
      redirect_to posts_url, notice: '文章删除成功。'
    end

    private
      # Use callbacks to share common setup or constraints between actions.
      def set_post
        @post = Post.find_by_slug!(params[:id])
      end

      # Only allow a trusted parameter "white list" through.
      def post_params
        params.require(:post).permit(:title, :slug, :body, :summary)
      end
  end
end
