class ArticlesController < ApplicationController

  before_action :article_find, only: [:show, :edit, :update, :destroy]
  def index 
    @articles = Article.paginate(page: params[:page], per_page: 3)
  end

  def show
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)
    if @article.save
       flash[:notice] = "Article was created successfully"
    redirect_to articles_path
    else  
      render "new"
    end
  end

  def edit 

  end

  def update
    if @article.update(article_params) 
      redirect_to articles_path
    else
      render :edit
    end
  end

  def destroy
    @article.destroy
    redirect_to articles_path
  end
  
  private 

  def article_find
    @article = Article.find_by_id(params[:id])
  end
  def article_params
    params.require(:article).permit(:title, :description, :user_id)
  end
end