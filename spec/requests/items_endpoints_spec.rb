require 'rails_helper'
=begin h
when I send a GET request to `/api/v1/items`
I receive a 200 JSON response containing all items
And each item has an id, name, description, and image_url but not the created_at or updated_at

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
      expect(last['name']).to eq(items.last.name)
      expect(last['description']).to eq(items.last.description)
    end
  end
end
