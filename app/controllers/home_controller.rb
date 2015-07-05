class HomeController < ApplicationController
  def index
    @articles = Article.all.limit(6).reverse_order
  end

  def about
  end

  def resume
  end
end
