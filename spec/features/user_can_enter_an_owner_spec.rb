require 'spec_helper'

feature 'User registers owner', %q{
  As a real estate associate
  I want to record a building owner
  So that I can keep track of our relationships with owners
} do



  before(:each) do
    visit '/owners/new'
  end

  context 'User creates owner with valid attributes' do
    it 'creates a building with valid attributes' do
      owner = FactoryGirl.create(:owner)
      fill_in "First name", with: owner.first_name
      fill_in "Last name", with: owner.last_name
      fill_in "Email", with: owner.email
      fill_in "Company", with: owner.company

      click_on "Register Owner"
      click_on "Owners"

      expect(page).to have_content(owner.first_name)
      expect(page).to have_content(owner.last_name)
      expect(page).to have_content(owner.email)
      expect(page).to have_content(owner.company)
    end
  end

  context 'User creates an owner with invalid attributes' do
    it 'creates an owner without valid inputs' do
      fill_in "First name", with: ""
      fill_in "Last name", with: ""
      fill_in "First name", with: ""

      click_on "Register Owner"

      expect(page).to have_content("First namecan't be blank")
      expect(page).to have_content("Last namecan't be blank")
      expect(page).to have_content("Emailcan't be blank")
    end

    it 'gets invalid when an invalid email is entered' do
      owner = FactoryGirl.create(:owner)
      fill_in "First name", with: owner.first_name
      fill_in "Last name", with: owner.last_name
      fill_in "Email", with: "asdasdas"

      click_on "Register Owner"

      expect(page).to have_content("Emailis invalid")
    end
  end
end
