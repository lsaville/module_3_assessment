require 'rails_helper'
=begin
s a user
When I visit "/"
And I fill in a search box with "80202" and click "search"
Then my current path should be "/search" (ignoring params)
And I should see stores within 25 miles of 80202
And I should see a message that says "16 Total Stores"
And I should see exactly 15 results
And I should see the long name, city, distance, phone number and store type for each of the 15 results

The name will be a link in the next story:

As a user
After I have searched a zip code for stores
When I click the name of a store
Then my current path should be "/stores/:store_id"
I should see the store name, store type and address with city, state and zip
I should see an unordered list of the store hours in the following format:
  * Mon: 10am-9pm
  * Tue: 10am-9pm
  * Wed: 10am-9pm
  * Thurs: 10am-9pm
  * Fri: 10am-9pm
  * Sat: 10am-9pm
  * Sun: 11am-7pm
=end
describe 'user' do
  context 'puts zip in search box and submits' do
    scenario 'they are directed to search path and see store info', :vcr do

      visit "/"

			fill_in 'search', with: '80202'
			click_on 'Search'

      expect(page).to have_content("Nearby Stores")
      expect(page).to have_css('div.store', count: 16)
      within('div.store', match: :first) do
        expect(page).to have_content('303-270-9189')
        expect(page).to have_content("Mobile")
        expect(page).to have_content(3.25)
        expect(page).to have_content("Cherry Creek Shopping Center")
        expect(page).to have_content("Denver")
      end
    end
  end
end
