require 'rails_helper'

describe BestBuyStore do
  context 'attributes' do
    it 'has name, city, distance, phone, and type' do
      raw_store_data = {
        :phone     => '303-270-9189',
        :storeType => 'Mobile',
        :name      => 'Cherry Creek',
        :city      => 'Denver',
        :distance  => 3.24
      } 

      store = BestBuyStore.new(raw_store_data)

      expect(store.phone).to eq('303-270-9189')
      expect(store.type).to eq('Mobile')
      expect(store.name).to eq('Cherry Creek')
      expect(store.city).to eq('Denver')
      expect(store.distance).to eq(3.24)
    end
  end
end
