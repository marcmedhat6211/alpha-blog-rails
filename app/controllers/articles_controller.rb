class ArticlesController < ApplicationController

  before_action :set_article, only: [:show, :edit, :update, :destroy]
  before_action :require_user, except: [:show, :index]
  # we've put this require_same_user method after the require_user method because the require_same_user requires that 
  # the current_user be defined, so if you put this method before the require_user method the code will blow up if user
  # is logged out because he doesn't know who the current_user is
  before_action :require_same_user, only: [:edit, :update, :destroy]
  
  def show
    #el params dyh hya el shayla el parameters el da5la fel url w hwa bey7otaha f hash
    # so 3ashan t3raf tgyb el param mn el hash btektebha as below
    # the @ before the article converts the regular variable to an instance variable to be able to send it to the template

    # @article = Article.find(params[:id])
  end

  # /articles
  # GET Request
  def index
    @articles = Article.paginate(page: params[:page], per_page: 5)
  end

  # /articles/new
  # GET Request
  def new
    #dyh ana lazem a7otaha 3ashan awl mara ba3mel fyha hit lel new route mabyeb2ash fyh variable esmo @article
    @article = Article.new
  end

  # /articles/:id/edit
  # GET Request
  def edit
    # @article = Article.find(params[:id])
  end

  # /articles
  # POST Request
  def create
    #dh 3ashan lw 3ayz ashoof el gy gwa el params as a json object
    # render plain: params[:title]

    #lama ba3mel post request byerga3ly el submitted data gwa el params hash
    # what i am doing here is that i get the big key which is articles, and then i tell him that i am just allowing the title and description to be submitted (dh f case en ana 3andy big key of article)
    # @article = Article.new(params.require(:article).permit(:title, :description))

    # in our case e7na just 3andena el params el bterga3 hya el title wel description f we just have to permit them as below
    @article = Article.new(article_params)
    #dh code temp keda l7ad bs ma5alas el authentication system
    @article.user = current_user # ba7ot en lama el user dh ye3mel el article dh, a assign el user lel article bta3o
    #save it to the database
    if @article.save

      # el flash dh hash fyh 2 things which are 1)notice, 2)alert, 1 is usually used for success msgs and 2 is usually used when something is wrong
      flash[:notice] = "Article was created successfully"

      # 3ashan te3raf eh el route name el enta me7tago, run --> "rails routes --expanded" and then use the prefix and append _path to it and if the route needed any parameters you'll have to provide one as below
      #hena ana ba2olo redirect b3d ma t save fel database to the show article route w badylo el article object w hwa beytala3 mno el id el hwa me7tago (f mmkn aktebo as below keda)
      # redirect_to article_path(@article)

      #keda brdo hwa hayefham en roo7 3ala el show list bta3et this article mn 3'er madylo article_path(@article) 
      redirect_to @article
    else
      render 'new'
    end
  end

  # /articles/:id
  # PATCH Request
  # PUT Request
  def update
    # @article = Article.find(params[:id])
    if @article.update(article_params)
      flash[:notice] = "Article was updated successfully"
      redirect_to @article
    else
      render 'edit'
    end
  end

  # /articles/:id
  # DELETE Request
  def destroy
    # @article = Article.find(params[:id])
    @article.destroy

    redirect_to articles_path
  end

  # private dyh m3naha en 2y 7aga t7tyha is private w msh lazem a7otelha end wala 7aga
  private

  def set_article
    @article = Article.find(params[:id])
  end

  def article_params
    params.require(:article).permit(:title, :description, category_ids: [])
  end

  def require_same_user
    if current_user != @article.user && !current_user.admin?
      flash[:alert] = "You can only edit or delete your own article"
      redirect_to @article
    end
  end

end