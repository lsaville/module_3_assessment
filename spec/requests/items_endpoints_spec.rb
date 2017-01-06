require 'rails_helper'

describe 'items endpoints' do
  context 'POST to /api/v1/items' do
    it 'returns json about the item and 201' do
      data = { item: {
        name: 'fluffy bunny',
        description: 'fluffy of course',
        image_url: 'some image'
      }}

      post '/api/v1/items', data
  
      result = JSON.parse(response.body)

      expect(response).to have_http_status(201)
      expect(result).to be_a(Hash)
      expect(result['name']).to eq('fluffy bunny')
      expect(result['description']).to eq('fluffy of course')
      expect(result['image_url']).to eq('some image')
      expect(result).to_not have_key('created_at')
      expect(result).to_not have_key('updated_at')
    end
  end

  context 'GET to /api/v1/items' do
    it 'returns all items' do
      items = create_list(:item, 3)

      get '/api/v1/items'

      response_items = JSON.parse(response.body)
      first = response_items.first
      last = response_items.last

      expect(response).to have_http_status(200)
      expect(response_items).to be_an(Array)
      expect(response_items.count).to eq(3)
      expect(first['name']).to eq(items.first.name)
      expect(first['description']).to eq(items.first.description)
      expect(first['image_url']).to eq(items.first.image_url)
      expect(first).to_not have_key('created_at')
      expect(first).to_not have_key('updated_at')
      expect(last['name']).to eq(items.last.name)
      expect(last['description']).to eq(items.last.description)
      expect(last['image_url']).to eq(items.last.image_url)
      expect(last).to_not have_key('created_at')
      expect(last).to_not have_key('updated_at')
    end
  end

  context 'GET to /api/v1/items/:id' do
    it 'returns the specific item' do
      item = create(:item)

      get "/api/v1/items/#{item.id}"

      result = JSON.parse(response.body)

      expect(response).to have_http_status(200)
      expect(result).to be_a(Hash)
      expect(result['name']).to eq(item.name)
      expect(result['description']).to eq(item.description)
      expect(result['image_url']).to eq(item.image_url)
      expect(result).to_not have_key('created_at')
      expect(result).to_not have_key('updated_at')
    end
  end

  context 'DELETE to /api/v1/items/:id' do
    it 'gives a 204' do
      item = create(:item)

      delete "/api/v1/items/#{item.id}"
      
      expect(response).to have_http_status(204)
    end
  end
end
