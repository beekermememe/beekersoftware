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
    save_ok = Articles.create_new(params)

    if save_ok
      redirect_to '/admin'
    else
      redirect_to '/admin/save_error'
    end
  end

  def save_error
  end

  def update
    update_ok = Articles.update_existing(params)
    redirect_to '/admin'
  end

  def articles
    render :json => Articles.all.to_json
  end

end
