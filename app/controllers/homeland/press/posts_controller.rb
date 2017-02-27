module Homeland::Press
  class PostsController < Homeland::Press::ApplicationController
    before_action :set_post, only: [:show, :edit, :update, :destroy]

    # GET /posts
    def index
      @posts = Post.published.order('published_at desc, id desc').page(params[:page]).per(10)
    end

    def upcoming
      @posts = Post.upcoming.order('id desc').page(params[:page]).per(10)
      render 'index'
    end

    # GET /posts/1
    def show
    end

    def preview
      out = Homeland::Markdown.call(params[:body])
      render plain: out
    end

    # GET /posts/new
    def new
      @post = Post.new
    end

    # GET /posts/1/edit
    def edit
    end

    # POST /posts
    def create
      @post = Post.new(post_params)

      if @post.save
        redirect_to @post, notice: 'Post was successfully created.'
      else
        render :new
      end
    end

    # PATCH/PUT /posts/1
    def update
      if @post.update(post_params)
        redirect_to @post, notice: 'Post was successfully updated.'
      else
        render :edit
      end
    end

    # DELETE /posts/1
    def destroy
      @post.destroy
      redirect_to posts_url, notice: 'Post was successfully destroyed.'
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
