require 'rails_helper'

describe BestBuyService do
  context 'find_stores' do
    it 'finds the stores by zipcode and returns a raw hash with symbolized keys', :vcr do
      service = BestBuyService.new('80205')
      raw_stores = service.store_finder
  
      expect(raw_stores.count).to eq(16)
      expect(raw_stores.first).to have_key(:phone)
      expect(raw_stores.first).to have_key(:storeType)
      expect(raw_stores.first).to have_key(:distance)
      expect(raw_stores.first).to have_key(:name)
      expect(raw_stores.first).to have_key(:city)
    end
  end
end
