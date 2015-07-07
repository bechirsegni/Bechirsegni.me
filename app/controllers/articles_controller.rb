class ArticlesController < ApplicationController
  before_action :set_article, only: [:show, :edit, :update, :destroy]
  before_filter :authenticate_user!, except: [:index, :show]
  before_filter :correct_user, only: [:edit, :update, :destroy]

  def index
    if params[:tag]
      @articles = Article.tagged_with(params[:tag]).paginate(:page => params[:page], :per_page => 9)
    else
  @articles = Article.all.search(params[:search]).paginate(:page => params[:page], :per_page => 9)
      end
  end

  def show
  end

  def new
    @article = current_user.articles.build
  end

  def edit
  end

  def create
    @article = current_user.articles.build(article_params)
    if @article.save!
      redirect_to @article, notice: 'Post was successfully created.'
    else
      render :new
    end
  end

  def update
    if @article.update(article_params)
      redirect_to @article, notice: 'Post was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @article.destroy
    redirect_to articles_url, notice: 'Post was successfully destroyed.'
  end

  private
  def set_article
    @article = Article.friendly.find(params[:id])
  end

  def article_params
    params.require(:article).permit(:title, :description, :duration,:image,:slug,:tag_list)
  end

  def correct_user
    @article = current_user.articles.friendly.find(params[:id])
    redirect_to articles_path, notice: "Not authorized to edit this Post" if @article.nil?
  end
end
