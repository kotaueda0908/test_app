class ArticlesController < ApplicationController
  before_action :sign_in_required

  def index
    @articles = current_user.articles.order(created_at: :desc)
  end

  def new
    @article = Article.new
  end

  def create
    @article = current_user.articles.new(article_params)

    if @article.save
      redirect_to root_url, notice: "記事「#{@article.title}」を登録しました。"
    else
      render :new
    end
  end

  def show
    @article = current_user.articles.find(params[:id])
  end

  def edit
    @article = current_user.articles.find(params[:id])
  end

  def update
    @article = current_user.articles.find(params[:id])

    if @article.update(article_params)
      redirect_to root_url(@article), notice: "記事「#{@article.title}」を更新しました"
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
