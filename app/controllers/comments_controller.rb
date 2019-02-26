class CommentsController < ApplicationController
    before_action :set_post
    def create
        @post.comments << Comment.create(comments_params)
        redirect_to @post
    end

    private

    def set_post
        @post = Post.find(params[:post_id])
    end

    def comments_params
        params.require(:comment).permit(:post_id, :body)
    end
end
