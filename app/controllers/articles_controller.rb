class ArticlesController < ApplicationController

  #Runs before specified 'only' methods
  before_action :set_article, only: [:show, :edit, :update, :destroy]

  def show
  end

  def index
    @articles = Article.all
  end

  def new
    @article = Article.new
  end

  def edit
  end
  
  def create
    @article = Article.new(article_params)
    if @article.save
      flash[:notice] = "Article was created successfully."
      redirect_to @article # shorcut of typing -> article_path(@article)
    else
      render 'new'
    end
  end

  def update 
    if @article.update(article_params)
      flash[:notice] = "Article has been updated successfully"
      redirect_to @article
    else
      render 'edit'
    end
  end

  def destroy 
    @article.destroy
    redirect_to articles_path
  end

  private #anything below here is private

  def set_article
    @article = Article.find(params[:id])
  end

  def article_params
    params.require(:article).permit(:title, :description)
  end

end