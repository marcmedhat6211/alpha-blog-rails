class ArticlesController < ApplicationController

  
  def show
    #el params dyh hya el shayla el parameters el da5la fel url w hwa bey7otaha f hash
    # so 3ashan t3raf tgyb el param mn el hash btektebha as below
    # the @ before the article converts the regular variable to an instance variable to be able to send it to the template
    @article = Article.find(params[:id])
  end

  def index
    @articles = Article.all
  end

  def new
    #dyh ana lazem a7otaha 3ashan awl mara ba3mel fyha hit lel new route mabyeb2ash fyh variable esmo @article
    @article = Article.new
  end

  def create
    #dh 3ashan lw 3ayz ashoof el gy gwa el params as a json object
    # render plain: params[:title]

    #lama ba3mel post request byerga3ly el submitted data gwa el params hash
    # what i am doing here is that i get the big key which is articles, and then i tell him that i am just allowing the title and description to be submitted (dh f case en ana 3andy big key of article)
    # @article = Article.new(params.require(:article).permit(:title, :description))

    # in our case e7na just 3andena el params el bterga3 hya el title wel description f we just have to permit them as below
    @article = Article.new(params.require(:article).permit(:title, :description))
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

end