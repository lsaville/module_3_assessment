class BestBuyService
  def initialize(zip)
    @zip = zip
  end

  def store_finder
    api_response = Faraday.get("https://api.bestbuy.com/v1/stores(area(#{zip},25))?format=json&show=phone,storeType,distance,name,city&pageSize=100&apiKey=#{ENV['key']}")
    JSON.parse(api_response.body, symbolize_names: true)[:stores]
  end

  private
    attr_reader :zip
end
