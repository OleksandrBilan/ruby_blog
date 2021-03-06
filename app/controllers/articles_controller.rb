class ArticlesController < ApplicationController

  	def index
  	    @articles = Article.where("status = ?", "public").order(updated_at: :desc).paginate(:page => params[:page], :per_page => 5)
  	end

  	def show
  	    @article = Article.find(params[:id])
  	end

  	def new
  	  	@article = Article.new
  	end

  	def create
  	  	@article = Article.new(article_params)
  	  	@article.author_email = current_user.email
		
  	  	if @article.save
  	  	  	redirect_to @article
  	  	else
  	  	  	render :new
  	  	end
  	end

  	def edit
  	  	@article = Article.find(params[:id])
  	end

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

  	  	redirect_to articles_url
  	end

  	def mine
  	 	@articles = Article.where("author_email = ?", current_user.email)
  	end

  	def find
		@articles = Article.all
		@articles = @articles.select { |article| article.title.include? params[:q] }
		@articles = Article.where(id: @articles.map(&:id)).order(updated_at: :desc).paginate(:page => params[:page], :per_page => 5)
  	end

  	def filter
  	  	@articles = Article.where(category: params[:q], status: "public").order(updated_at: :desc).paginate(:page => params[:page], :per_page => 5)
  	end

  	private
  	  	def article_params
  	    	params.require(:article).permit(:title, :body, :author_nickname, :author_email, :status, :category, :picture)
  	  	end

end
