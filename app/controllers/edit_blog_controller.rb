class EditBlogController < ApplicationController
  def index
    @articles = Articles.all
  end

  def delete
    Article.find(:id => params[:id]).delete
  end

  def add
    Article.create(
      :title => params[:title],
      :content => params[:content],
      :author => params[:author]
      )
    @articles = Articles.all
  end
end
