class CommentsController < ApplicationController
  before_action :set_comment, only: [:create, :edit, :update, :destroy]
  
  def edit
    @article = Article.find(params[:article_id])
    @comment = current_user.comments.find(params[:id])
  end

  def update
    @article = Article.find(params[:article_id])
    @comment = current_user.comments.find(params[:id])
    respond_to do |format|
      if @comment.update(comment_params)
        format.html { redirect_to article_path(@article), notice: "Article Update successfully." }
        format.js
      end
    end
  end

  def create
    @comment = @article.comments.build(comment_params)
    respond_to do |format|
      if @comment.save
        format.js
        format.html { redirect_to article_path(@article), notice: "Save comment completed!" } 
      end
    end
  end
  
  def destroy
    @comment = current_user.comments.find(params[:id])
    respond_to do |format|
      if @comment.destroy
        format.js 
      end
    end
  end

  private
    def comment_params
      params.require(:comment).permit(:commenter, :user_id)
    end

    def set_comment
      @article = Article.find(params[:article_id])
    end
end
