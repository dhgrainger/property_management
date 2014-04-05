require 'spec_helper'

feature 'Building belongs to owner', %q{
  As a real estate associate
  I want to correlate an owner with buildings
  So that I can refer back to pertinent information
} do



  context 'I can create a building with an owner' do
    it 'assings a new building to an owner' do
      owner = Owner.create({ first_name: 'doug', last_name: 'grainger', email: 'lydia@sloppymail.com'})
      visit '/buildings/new'

      fill_in "Address", with: '6 spice street'
      fill_in "City", with: 'Charlestown'
      select "MA", from: "State"
      fill_in "Postal code", with: "02129"
      fill_in "Description", with: "abandoned warehouse"
      select owner.full_name, from: 'Owner'

      click_on "Register Building"
      visit buildings_path

      expect(page).to have_content(owner.full_name)
    end

    it 'deletes user' do
      owner = Owner.create({ first_name: 'doug', last_name: 'grainger', email: 'lydia@sloppymail.com'})
      visit '/buildings/new'


      fill_in "Address", with: '6 spice street'
      fill_in "City", with: 'Charlestown'
      select "MA", from: "State"
      fill_in "Postal code", with: "02129"
      fill_in "Description", with: "abandoned warehouse"
      select owner.full_name, from: 'Owner'

      click_on "Register Building"
      visit owners_path

      count = Owner.count
      countBuild = Building.count

      click_on "Destroy"

      expect(Owner.count).to eq(count -1)
      expect(Building.count).to eq(countBuild)

    end
  end
end
