class SearchController < ApplicationController
  def index
		zip = params[:search]
    api_response = Faraday.get("https://api.bestbuy.com/v1/stores(area(#{zip},25))?format=json&show=phone,storeType,distance,name,city&pageSize=100&#{ENV['key']}")
		parsed_response = JSON.parse(api_response.body, symbolize_names: true)
binding.pry
  end
end
