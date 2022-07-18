class SearchController < ApplicationController
  def index
    @articles = Article.search(search_params[:q]).records.all
  end

  private

  def search_params
    params.permit(:q)
  end
end
