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

  def create
    @article = Article.new(article_params)

    if @article.save
      redirect_to @article
    else
      # note: render not redirect so it's done on the same request as form submission
      render 'new'
    end
  end

  private
    def article_params
      params.require(:article).permit(:title, :text)
    end
end
