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

  end

  def create
    render plain: params[:article]
  end

end