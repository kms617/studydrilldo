require 'rails_helper'

feature 'user views her goals' do

  scenario 'user views a new goal after it has been submitted' do
    # After I submit my form, I can see all of the information for
    # my goal on its own page.

    goal = FactoryGirl.create(:goal)

    visit goal_path(goal)

    expect(page).to have_content(goal.goal)
    expect(page).to have_content(goal.duration)
    expect(page).to have_content(goal.objective)

    end

  scenario 'user views a list of her goals' do
    # I can also view a list of all of the goals I have set
    # for myself, displaying those which I'm still working on first,
    # followed by my most recently set goals.

    goals = []
    goals = FactoryGirl.create_list(:goal, 5)

    visit goals_path

    goals.each do |goal|
      expect(page).to have_content(goal.goal)
    end
  end
end
