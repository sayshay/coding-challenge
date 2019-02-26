class CommentsController < ApplicationController
    before_action :set_post
    before_action :set_comment, only: [:destroy, :edit, :update]

    def create
        @comment = @post.comments.new(comments_params)
        if @comment.save
            redirect_to @post
        else
            render 'posts/show'
        end
    end

    def destroy
        @comment.destroy if @comment
        redirect_to @post
    end

    def edit
    end

    def update
        if @comment.update(comments_params)
            redirect_to @post
        else
            render :edit
        end
    end

    private

    def set_post
        @post = Post.find(params[:post_id])
    end

    def set_comment
        @comment = Comment.find(params[:id])
    end

    def comments_params
        params.require(:comment).permit(:post_id, :body)
    end
end
