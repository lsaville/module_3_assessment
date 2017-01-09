class SearchController < ApplicationController
  def index
    api_response = Faraday.get("https://api.bestbuy.com/v1/stores(area(#{zip},25))?format=json&show=phone,storeType,distance,name,city&pageSize=100&apiKey=#{ENV['key']}")
		parsed_response = JSON.parse(api_response.body, symbolize_names: true)[:stores]
    @stores = BestBuyStore.get_stores(params[:search])
    @stores = parsed_response.map do |raw_store|
      BestBuyStore.new(raw_store)
    end
  end
end
