require 'rails_helper'
=begin h
When I send a GET request to `/api/v1/items/1`
I receive a 200 JSON response containing the id, name, description, and image_url but not the created_at or updated_at

When I send a DELETE request to `/api/v1/items/1`
I receive a 204 JSON response if the record is successfully deleted

When I send a POST request to `/api/v1/items` with a name, description, and image_url
I receive a 201 JSON  response if the record is successfully created
And I receive a JSON response containing the id, name, description, and image_url but not the created_at or updated_atdescribe 'items endpoint' do
=end
describe 'items endpoints' do
  context 'GET to /api/v1/items' do
    it 'returns all items' do
      items = create_list(:item, 3)

      get '/api/v1/items'

      response_items = JSON.parse(response.body)
      first = response_items.first
      last = response_items.last

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

      expect(result).to be_a(Hash)
      expect(result['name']).to eq(item.name)
      expect(result['description']).to eq(item.description)
      expect(result['image_url']).to eq(item.image_url)
      expect(result).to_not have_key('created_at')
      expect(result).to_not have_key('updated_at')
    end
  end
end
