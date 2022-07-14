class ArticlesController < ApplicationController
    def index
        @articles = Article.all
    end

    def new
    end

    def edit
      @article = Article.find(params[:id]) 
    end

    def create
      @article = Article.create(article_params)
      if @article.save
        redirect_to @article
      else
        render "new"
      end
    end

    def show
      @article = Article.find(params[:id])
    end

    def update
      @article = Article.find(params[:id])

      respond_to do |format|
        if @article.update(article_params)
          flash[:notice] = 'article was successfully updated.'
          format.html { redirect_to(@article) }
          format.xml  { head :ok }
        else
          format.html { render :action => "edit" }
          format.xml  { render :xml => @article.errors,
                      :status => :unprocessable_entity }
        end
      end
    end

    private
    def article_params
      params.require(:article).permit(:title, :body)
    end
end