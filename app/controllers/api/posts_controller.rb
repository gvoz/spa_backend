module Api
  class PostsController < ApplicationController
    before_action :find_post, only: [:show, :update, :destroy]

    def index
      @post = Post.all.order(date: :asc)
      render json: @post
    end

    def show
      render json: @post
    end

    def create
      @post = Post.new(post_params)

      if @post.save
        render json: @res
      else
        render json: { errors: @post.errors }
      end
    end

    def update
      if @post.update(post_params)
        render json: @res
      else
        render json: { errors: @post.errors }
      end
    end

    def destroy
      @post.destroy
      render json: { success: true }, status: 204
    end

    private
      def post_params
        params.require(:post).permit(:title, :date, :body, :username)
      end

      def find_post
        @post = Post.find(params[:id])
      end
  end
end
