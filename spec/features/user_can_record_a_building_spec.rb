require 'spec_helper'

feature 'User registers building', %q{
  As a real estate associate
  I want to record a building
  So that I can refer back to pertinent information
} do

  building = FactoryGirl.create(:building)

  context 'a building is entered with valid attributes' do
    it 'create a building with valid attributes' do
      visit '/buildings/new'

        fill_in "Street address", with: building.address
        fill_in "City", with: building.city
        select building.state, from: "State"
        fill_in "Postal code", with: building.postal_code
        fill_in "Description", with: building.description

        click_on "Register Building"

        expect(page).to have_content("building.address")
        expect(page).to have_content("building.city")
        expect(page).to have_content("building.state")
        expect(page).to have_content("building.postal_code")
        expect(page).to have_content("building.description")
    end

  end
end
