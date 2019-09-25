class ArticlesController < ApplicationController

 def index
    @articles = Article.paginate(:page =>params[:page], per_page: 1)
	
  end

 def show
    @article = Article.find(params[:id])
  end
def new
@article = Article.newTest
end
def create 
@article = current_user.articles.build(article_params)
 

 if @article.save
  redirect_to @article
  else
  render 'new'
  end
end
 def destroy
    @article = Article.find(params[:id])
    @article.destroy

    redirect_to articles_path
  end
private
  def article_params
 params.require(:article).permit(:title, :text, :image, :image_cache)
  end
end
