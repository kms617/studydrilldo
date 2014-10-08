require 'rails_helper'

feature 'user updates a task' do
  before :each do
    @goal = FactoryGirl.create(:goal)
    @task = FactoryGirl.create(:task)
    @methodology = Factory.Girl.create(:methodology)
  end

  scenario 'user updates a task successfully' do
    # I want to be able to revise a task if I reevaluate my priorities or
    #discover something new. Or if I make a mistake.
    visit edit_task_path(@task)

    fill_in "Description", with: "Learn lots of Ruby"
    click_button "Update Task"

    expect(page).to have_content("Task Updated")
    expect(page).to have_content(@task.focus)
    expect(page).to have_content(@task.duration)
    expect(page).to have_content("Learn lots of Ruby")
  end

  scenario 'user updates a task but leaves the form blank' do
    # I want to be able to revise a task if I reevaluate my priorities or
    #discover something new. Or if I make a mistake.
    visit edit_task_path(@task)

    fill_in "Goal", with: ""
    fill_in "Duration", with: ""
    fill_in "Description", with: ""
    click_button "Update Task"

    expect(page).to have_content("There was a problem, please try again.")
    expect(page).to have_content("Focus can't be blank")
    expect(page).to have_content("Duration can't be blank")
    expect(page).to have_content("Duration is not a number")
  end

  scenario 'user deletes a task' do
    #If I don't do it afterall, I want to be able to remove
    #a task from my learning portfolio.
    visit edit_task_path(@task)

    click_link "Delete"

    expect(page).to have_content("Task Deleted")
  end
end
