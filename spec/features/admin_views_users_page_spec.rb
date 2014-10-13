require 'rails_helper'

feature 'admin can see a list of users' do

  let(:admin) { FactoryGirl.create(:user, role: 'admin') }
  let!(:member) { FactoryGirl.create(:user) }

  scenario 'admin visits users index' do
    sign_in_as(admin)
    visit admin_users_path

    expect(page).to have_content(member.email)
  end

  scenario 'unauthorized users are redirected' do
    sign_in_as(member)
    visit admin_users_path

    expect(page).to have_content("The page you were looking for doesn't exist.")
  end

end
