class ArticlesController < ApplicationController
  before_action :authenticate_user!,except: [:show, :index]
  before_action :set_article,except: [:new, :index, :create]
  def index	
  	@articles = Article.all
  end

  #GET /articles/:id
  def show
  	@article.update_visits_count
  end

#GET articles/new
  def new
  	@article = Article.new
  end

  #POST /articles
  #INSER INTO
  def create
  	@article = current_user.articles.new(article_params)

  	if @article.save
  		redirect_to @article
  	else
  		render :new
  	end
  end

  def edit
    
  end

  #PUT /articles/:id
  #update
  def update

    if @article.update(article_params)
        redirect_to @article
    else
        render :edit
    end    
  end

  def destroy
  	
  	@article.destroy
  	redirect_to articles_path
  end


  private

  def set_article
    @article = Article.find(params[:id])

  end

  def validate_user
    redirect_to new_user_session_path, notice: "Necesitas iniciar sesión"
  end

  def article_params
  	params.require(:article).permit(:title,:body)
  end
end
