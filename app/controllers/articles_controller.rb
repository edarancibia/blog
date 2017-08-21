class ArticlesController < ApplicationController
  def index	
  	@articles = Article.all
  end

  #GET /articles/:id
  def show
  	@article = Article.find(params[:id])
  end

#GET articles/new
  def new
  	@article = Article.new
  end

  #POST /articles
  #INSER INTO
  def create
  	@article = Article.new(article_params)

  	if @article.save
  		redirect_to @article
  	else
  		render :new
  	end
  end

  def edit
    @article = Article.find(params[:id])
  end

  #PUT /articles/:id
  #update
  def update
    @article = Article.find(params[:id])

    if @article.update(article_params)
        redirect_to @article
    else
        render :edit
    end    
  end

  def destroy
  	@article = Article.find(params[:id])
  	@article.destroy
  	redirect_to articles_path
  end


  private

  def article_params
  	params.require(:article).permit(:title,:body)
  end
end