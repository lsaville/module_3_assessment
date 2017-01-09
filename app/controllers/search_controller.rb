class SearchController < ApplicationController
  def index
    @stores = BestBuyStore.get_stores(params[:search])
  end
end
