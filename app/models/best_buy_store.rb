class BestBuyStore
  attr_reader :phone, :distance, :type, :name, :city

  def initialize(data)
    @phone    = data[:phone]
    @distance = data[:distance]
    @type     = data[:storeType]
    @name     = data[:name]
    @city     = data[:city]
  end
end
