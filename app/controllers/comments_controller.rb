class CommentsController < ApplicationController
    def create
        @article = Article.find(params[:article_id])
        @comment = @article.comments.create(comment_params)
        @comment.user = current_user
        if @comment.save
            flash[:success] = "Comment successfully added"
            redirect_to article_path(@article)
        else
            @comment.errors.full_messages.each do |msg|
                msg
            end
        end
    end

    def destroy
        @article = Article.find(params[:article_id])
        @comment = @article.comments.find(params[:id])
        @comment.destroy
        redirect_to article_path(@article)
    end

    private
    def comment_params
        params.require(:comment).permit(:title, :body)
    end


end
