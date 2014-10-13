require 'rails_helper'

feature 'user sign up', %Q{
  As an authenticated user, I want to be able to
  sign-up and save a profile with all of my goals,
  tasks and progress.
  } do

    #Acceptance Criteria
     # 1. I must specify a valid email address.
     # 2. I must specify a valid username.
     # 3. I must specify a password and confirm that password.
     # 4. If I do not do the above, I get an error message.
     # 5.  If I specify valid information, I register my account and get confirmation.

  scenario 'specifying valid and required information' do
    user = FactoryGirl.build(:user)
    ActionMailer::Base.deliveries = []
    visit root_path

    click_link "Sign Up"

    fill_in "Email", with: user.email
    fill_in "First Name", with: user.first_name
    fill_in "Last Name", with: user.last_name
    fill_in "Username", with: user.username
    fill_in "user_password", with: user.password
    fill_in "user_password_confirmation", with: user.password
    click_button "Sign up"

    expect(page).to have_content("A message with a confirmation link has been sent to your email address. Please follow the link to activate your account.")
    expect(ActionMailer::Base.deliveries.count).to eq(1)
  end

  scenario 'required information is not specified' do
    visit root_path
    click_link "Sign Up"

    click_button "Sign up"

    expect(page).to have_content("Please review the problems below:")
    expect(page).to have_content("can't be blank")
  end

  scenario 'passwords do not match' do
    user = FactoryGirl.build(:user)
    visit root_path

    click_link "Sign Up"

    fill_in "Email", with: user.email
    fill_in "First Name", with: user.first_name
    fill_in "Last Name", with: user.last_name
    fill_in "Username", with: user.username
    fill_in "user_password", with: user.password
    fill_in "user_password_confirmation", with: ""
    click_button "Sign up"

    expect(page).to have_content("Please review the problems below:")
    expect(page).to have_content("doesn't match Password")
  end
end
