class ArticlesController < ApplicationController
  before_action :authenticate_user!, except: [:top]
  before_action :sign_in_required, except: [:top]

  def top
  end

  def index
    @q = current_user.articles.ransack(params[:q])
    @articles = @q.result(distinct: true)
    @articles = Article.all.page(params[:page]).per(5)
  end

  def new
    @article = Article.new
  end

  def create
    @article = current_user.articles.new(article_params)

    if @article.save
      redirect_to articles_url, notice: "記事「#{@article.title}」を登録しました。"
    else
      render :new
    end
  end

  def show
    @article = current_user.articles.find(params[:id])
    @like = Like.new
  end

  def edit
    @article = current_user.articles.find(params[:id])
  end

  def update
    @article = current_user.articles.find(params[:id])

    if @article.update(article_params)
      redirect_to articles_url, notice: "記事「#{@article.title}」を更新しました"
    else
      render :edit
    end
  end

  def destroy
    article = current_user.articles.find(params[:id])
    article.destroy
    redirect_to articles_url, notice: "記事「#{article.title}」を削除しました。"
  end

  private

  def article_params
    params.require(:article).permit(:title, :content)
  end
end
