class PaginationController < ArticlesController
  def index
  @articles = get_articles

    # total count of pages 
    @page_count = @articles.total_articles
    # url for ajax requests
    @endpoint   = '/articles/pagination'
  end

  def pagination
    render partial: 'articles/index', layout: false, locals: { articles: get_articles }
  end

  def get_articles
   page  = params[:page].present? ? params[:page] : 1
    # per_page is a class variable defined in the Post model class
    articles = articles.paginate(page: page, articles_path: Article.per_page)
  end
end
