require 'rails_helper'

feature 'user signs in', %Q{
  As a user
  I want to sign in
  so that I can track my goals, steps
  and progress
} do

  # Acceptance Criteria:
  # 1.If I specify a valid, previously registered email and password
  #   I am authenticated and I gain access to the system.
  # 2.If I specify an invalid email and password, I can't log in
  # 3.If I am already logged in, I can't sign in again

  scenario 'an existing user specifies a valid email and password' do
    user = FactoryGirl.create(:user)
    visit root_path
    click_link "Login"

    fill_in "Email", with: user.email
    fill_in "Password", with: user.password
    click_button "Login"

    expect(page).to have_content ("Signed in successfully.")
    expect(page).to_not have_content ("Login")
  end

  scenario 'a user specifies invalid email and password' do
    visit root_path
    click_link "Login"

    fill_in "Email", with: "foo@foobar.com"
    fill_in "Password", with: "foobar"
    click_button "Login"

    expect(page).to have_content ("Invalid email address or password.")
  end

  scenario 'existing email with the wrong password is denied access' do
    user = FactoryGirl.create(:user)
    visit root_path
    click_link "Login"

    fill_in "Email", with: user.email
    fill_in "Password", with: "foobar"
    click_button "Login"

    expect(page).to have_content ("Invalid email or password.")
  end
end
