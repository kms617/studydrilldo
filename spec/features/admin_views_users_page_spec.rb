require 'rails_helper'

feature 'admin can see a list of users', focus: true do

  let(:admin) { FactoryGirl.create(:user, role: 'admin') }
  let!(:user) { FactoryGirl.create(:user) }

  scenario 'admin visits users index' do
    sign_in_as(admin)
    visit '/admin/users'
    expect(page).to have_content(user.email)
  end

  scenario 'unauthorized users are redirected' do
    sign_in_as(user)
    visit '/admin/users'
    expect(page).to have_content('not authorized')
    expect(current_path).to eq(root_path)
  end

end
