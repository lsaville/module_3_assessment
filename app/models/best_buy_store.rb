class BestBuyStore
  def initialize(data)
    @phone    = data[:phone]
    @distance = data[:distance]
    @type     = data[:storeType]
    @name     = data[:name]
    @city     = data[:city]
  end
end
