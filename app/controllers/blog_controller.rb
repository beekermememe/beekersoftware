class BlogController < ApplicationController

  def index
    @articles = Articles.all
  end

end