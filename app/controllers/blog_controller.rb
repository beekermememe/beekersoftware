class BlogController < ApplicationController

  def index
    @articles = Articles.all.where(publish: true)
  end

end