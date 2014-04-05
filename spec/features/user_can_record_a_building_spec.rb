require 'spec_helper'

feature 'User registers building', %q{
  As a real estate associate
  I want to record a building
  So that I can refer back to pertinent information
} do



  before(:each) do
    visit '/buildings/new'
  end

  context 'a building is entered with valid attributes' do
    it 'create a building with valid attributes' do
      building = FactoryGirl.create(:building)
      fill_in "Address", with: building.address
      fill_in "City", with: building.city
      select building.state, from: "State"
      fill_in "Postal code", with: building.postal_code
      fill_in "Description", with: building.description

      click_on "Register Building"
      click_on "Buildings"

      expect(page).to have_content(building.address)
      expect(page).to have_content(building.city)
      expect(page).to have_content(building.state)
      expect(page).to have_content(building.postal_code)
      expect(page).to have_content(building.description)

    end
  end

  context 'user signs in with invalid attributes' do
    it 'creates a building without inputs' do

      click_on "Register Building"

      expect(page).to have_content("Addresscan't be blank")
      expect(page).to have_content("Citycan't be blank")
      expect(page).to have_content("Statecan't be blank")
      expect(page).to have_content("Postal codecan't be blank")
    end

    it 'create a building with a valid postal code' do
      building = FactoryGirl.create(:building)
      fill_in "Address", with: building.address
      fill_in "City", with: building.city
      select building.state, from: "State"
      fill_in "Postal code", with: "asdasdaf"
      fill_in "Description", with: building.description

      click_on "Register Building"

      expect(page).to have_content("Postal codeis invalid")
    end
  end
end
