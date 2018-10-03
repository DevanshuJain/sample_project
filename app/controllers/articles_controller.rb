class ArticlesController < ApplicationController
  load_and_authorize_resource

  def index
    if current_user.has_role? :admin
      redirect_to admins_path
    end
    @articles = Article.all
  end

  def new
    @article = current_user.articles.new 
  end
  
  def edit
    @article = Article.find(params[:id])
  end

  def update
    @article = current_user.articles.find(params[:id])
    if @article.update(article_params)
      redirect_to articles_path, notice: 'Article Update successfully.'
    else
      render 'edit'
    end
  end

  def show
    @article = Article.find(params[:id])
    @comment = @article.comments.new
    # @comments = @article.comments.all
  end

  def create
    @article = current_user.articles.new(article_params)
    if @article.save
      redirect_to articles_path, notice: 'Article Create successfully.'
    else
      render 'new'
    end
  end

  def destroy
    @article = current_user.articles.find(params[:id])
    if @article.destroy
      redirect_to articles_path, notice: 'Article destroy successfully.'
    end
  end

  private
  def article_params
    params.require(:article).permit(:title)
  end
end
