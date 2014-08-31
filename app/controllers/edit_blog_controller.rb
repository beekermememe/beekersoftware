class EditBlogController < ApplicationController
  skip_before_filter :verify_authenticity_token, :only => [:create]
  def index
    @articles = Articles.all
  end

  def delete
    Article.find(:id => params[:id]).delete
  end

  def new

  end

  def create
    binding.pry
    article = Articles.create(
      :title => params[:title],
      :content => params[:content],
      :author => params[:author]
      )
    article.save!
    redirect_to '/admin'
  end

  def articles
    render :json => Articles.all.to_json
  end

end
