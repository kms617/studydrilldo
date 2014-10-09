require 'rails_helper'

feature 'admin can see a list of users' do

  let(:admin) { FactoryGirl.create(:user, role: 'admin') }
  let!(:user) { FactoryGirl.create(:user) }

  scenario 'admin successfully deletes a user' do
    sign_in_as(admin)
    visit admin_users_path

    click_link "Delete"

    expect(page).to have_content("User successfully deleted.")
    expect(page).to_not have_content(user.username)
  end
end
