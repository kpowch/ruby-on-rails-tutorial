class ArticlesController < ApplicationController
  # CRUD actions are usually added in the following order:
  # index, show, new, edit, create, update, destroy

  def index
    @articles = Article.all
  end

  def show
    @article = Article.find(params[:id])
  end

  def new
    @article = Article.new
  end

  def edit
    @article = Article.find(params[:id])
  end

  def create
    @article = Article.new(article_params)

    if @article.save
      redirect_to @article
    else
      render 'new' # not redirect cuz we want it on the form request (not new req)
    end
  end

  # Note: not all attributes need to be sent here - just what needs updating
  def update
    @article = Article.find(params[:id])

    if @article.update(article_params)
      redirect_to @article
    else
      render 'edit'
    end
  end

  private
    def article_params
      params.require(:article).permit(:title, :text)
    end
end
