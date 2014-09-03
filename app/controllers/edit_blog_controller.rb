class EditBlogController < ApplicationController
  skip_before_filter :verify_authenticity_token, :only => [:create, :update]
  def index
    @articles = Articles.all
  end

  def delete
    article = Articles.find(params[:id])
    article.delete if article
    render :json => {"response" => "deleleted"}
  end

  def new

  end

  def edit
    @article = Articles.find(params[:id])
  end


  def create
    article = Articles.create(
      :title => params[:title],
      :content => params[:content],
      :author => params[:author],
      :publish => params[:publish].to_s == "on" ? true : false
      )
    article.save!
    redirect_to '/admin'
  end

  def update
    article = Articles.find(params[:id])
    article.update(
      :title => params[:title],
      :content => params[:content],
      :author => params[:author],
      :publish => params[:publish].to_s == "on" ? true : false
      )
    article.save!
    redirect_to '/admin'
  end

  def articles
    render :json => Articles.all.to_json
  end

end
