class ArticlesController < ApplicationController



  def index
    @articles = Article.all
  end

  def new
    @article = Article.new
  end

  def update
    @article = Article.find(params[:id])
    if @article.update(article_params)
      flash[:notice] = "Article updated with success"
      redirect_to article_path(@article)
    else
      render 'edit'
    end
  end

  def edit
    @article = Article.find(params[:id])
  end

  def show
    @article = Article.find(params[:id])
  end

  def destroy
    @article = Article.find(params[:id])
    @article.destroy
    flash[:notice] = "Article was removed"
    redirect_to articles_path
  end

  def create
    @article = Article.new(article_params)
    if @article.save
      flash[:notice] = "Article was successfully created"
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

end
