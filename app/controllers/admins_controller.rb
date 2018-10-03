class AdminsController < ApplicationController
  def index
    @articles = Article.where(status: false)
  end

  def verify
    @p = params[:article_id]
    @article = Article.find(@p)
    @q = @article.update_columns(:status => :true )
    redirect_to admins_path, notice: 'Article Verify successfully.'
  end

  def destroy
    @article =Articlie.find(params[:id])
    if @article.destroy
      redirect_to admins_path, notice: 'Article Remove successfully.'
    end    
  end

end
