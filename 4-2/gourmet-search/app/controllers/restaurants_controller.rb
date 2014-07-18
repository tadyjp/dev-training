class RestaurantsController < ApplicationController

  # 検索ページ
  def search
    Restaurant.search(params[:q], limit: 20).tap do |response|
      @restaurants = response[:restaurants]
      @pref_facets = response[:pref_facets]
    end
  end

  # 詳細ページ
  def detail
    @restaurant = Restaurant.find(params[:id])
  end
end
