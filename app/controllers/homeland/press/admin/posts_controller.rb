module Homeland::Press::Admin
  class PostsController < ::Admin::ApplicationController
    layout '/layouts/admin'

    def index
      @posts = Post.includes(:user).order("id desc").page(params[:page])
    end

    def destroy
      @post = Post.find_by_slug!(params[:id])
      @post.destroy
      redirect_to admin_posts_path
    end
  end
end
