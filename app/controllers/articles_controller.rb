class ArticlesController < ApplicationController

  # método set_article (que é privado), é chamado pelos métodos (publicos)
  # update, edit, show e destroy assim que eles são invocados
  before_action :set_article, only: [:update, :edit, :show, :destroy]

  def index
    @articles = Article.all
  end

  def new
    @article = Article.new
  end

  def update
    if @article.update(article_params)
      flash[:success] = "Article updated with success"
      redirect_to article_path(@article)
    else
      render 'edit'
    end
  end

  def edit
  end

  def show
  end

  def destroy
    @article.destroy
    flash[:danger] = "Article was removed"
    redirect_to articles_path
  end

  def create
    @article = Article.new(article_params)
    if @article.save
      flash[:success] = "Article was successfully created"
      redirect_to article_path(@article)
    else
      render 'new'
    end
  end

  private
    def article_params
      # Allows you to choose which attributes should be whitelisted for mass
      # updating and thus prevent accidentally exposing that which shouldn't be
      # exposed. Provides two methods for this purpose: require and permit.
      # The former is used to mark parameters as required. The latter is used
      # to set the parameter as permitted and limit which attributes should be
      # allowed for mass updating.
      params.require(:article).permit(:title, :description)
    end

    def set_article
      @article = Article.find(params[:id])
    end

end
