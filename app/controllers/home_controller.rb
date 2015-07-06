class HomeController < ApplicationController
  def index
    @articles = Article.all.limit(6).reverse_order
  end

  def about
    @technologies = Technology.all
  end

  def resume
    @educations = Education.all
    @experiences = Experience.all
    @technologies = Technology.all
  end
end
