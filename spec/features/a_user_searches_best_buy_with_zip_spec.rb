require 'rails_helper'

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
