require 'rails_helper'

feature 'user updates a goal' do
   before :each do
    @user = FactoryGirl.create(:user)
    @goal = FactoryGirl.create(:goal)
    @methodology = FactoryGirl.create(:methodology)

    sign_in_as(@user)
  end

  scenario 'user updates a goal successfully' do
    # I want to be able to revise a goal if I reevaluate my priorities or
    #discover something new. Or if I make a mistake.
    visit edit_goal_path(@goal)

    fill_in "Objective", with: "Learn lots of Ruby"
    click_button "Update Goal"

    expect(page).to have_content("Goal Updated")
    expect(page).to have_content(@goal.name)
    expect(page).to have_content(@goal.duration)
    expect(page).to have_content("Learn lots of Ruby")
  end

  scenario 'user updates a goal but leaves the form blank' do
    # I want to be able to revise a goal if I reevaluate my priorities or
    #discover something new. Or if I make a mistake.
    visit edit_goal_path(@goal)

    fill_in "Goal", with: ""
    fill_in "Duration", with: ""
    fill_in "Objective", with: ""
    click_button "Update Goal"

    expect(page).to have_content("There was a problem, please try again.")
    expect(page).to have_content("Name can't be blank")
    expect(page).to have_content("Duration can't be blank")
    expect(page).to have_content("Duration is not a number")
  end

  scenario 'user deletes a goal' do
    #If I change my overall focus, I want to be able to remove
    #a goal from my learning portfolio.
    visit edit_goal_path(@goal)

    click_link "Delete"

    expect(page).to have_content("Goal Deleted")
  end
end
