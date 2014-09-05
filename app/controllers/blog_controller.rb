class BlogController < ApplicationController

  def index
    @articles = Articles.all.where(publish: true)
  end

  def article
   @article = Articles.find(params[:id])
   render :json => @article.to_json
  end

end