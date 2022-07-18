class SearchController < ApplicationController
  def index
    @articles = if search_params[:fuzzy].to_i.zero?
                  Article.search(search_params[:q]).records.all
                else
                  Article.highlight_query(search_params[:q]).results
                end
  end

  private

  def search_params
    params.permit(:q, :fuzzy)
  end
end
