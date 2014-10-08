require 'rails_helper'

feature 'user submits a new step' do
  #As a learner, I want to keep track of the
  #steps I've taken to reach my goal.

  before :each do
    @goal = FactoryGirl.create(:goal)
    @methodology = FactoryGirl.create(:methodology)
  end

  scenario 'user submits a new step with a complete form' do
    #I can add a step towards a goal. Each task must include:
    #the focus of the step, if it's completed or planned, its
    #duration, and the appropriate methodology.
    #I can optionally include a description of the task.
    task = FactoryGirl.create(:task)
    visit goal_path(@goal)

    fill_in "Focus", with: task.focus
    fill_in "Duration", with: task.duration
    fill_in "Description", with: task.description
    choose 'task_completed_false'
    select @methodology.name, :from => "task_methodology_id"
    click_button "Create Task"

    expect(page).to have_content("Step successfully taken!")
    expect(page).to have_content(task.focus)
  end

  scenario 'user submits an incomplete form for a step' do
    #If I fail to submit a complete form, I want to receive an
    #error message prompting me to provide correct information and
    #alerting me to my errors.

    visit goal_path(@goal)

    click_button "Create Task"

    expect(page).to have_content("There was a problem, please try again.")
    expect(page).to have_content("Focus can't be blank")
    expect(page).to have_content("Duration can't be blank")
    expect(page).to have_content("Duration is not a number")
    expect(page).to have_content("Completed is not included in the list")
    expect(page).to have_content("Methodology can't be blank")
  end

  scenario 'user submits form with errors' do
    #If there are errors in my form, I want to receive an
    #error message detailing my mistakes so that I can correct them.

    visit goal_path(@goal)

    fill_in "Focus", with: "As late as the 1960s many people perceived computer
                            programming as a natural career choice for savvy young women. Even the
                            trend-spotters at Cosmopolitan Magazine urged their fashionable female readership
                            to consider careers in programming."
    fill_in "Duration", with: "twenty"
    choose 'task_completed_false'
    fill_in "Description", with: "In an article titled “The Computer Girls,”
                                  the magazine described the field as offering better job opportunities for women
                                  than many other professional careers. As computer scientist Dr. Grace Hopper
                                  told a reporter, programming was “just like planning a dinner. You have to plan
                                  ahead and schedule everything so that it’s ready when you need it…. Women are
                                  ‘naturals’ at computer programming.” James Adams, the director of education for
                                  the Association for Computing Machinery, agreed: “I don’t know of any other field,
                                  outside of teaching, where there’s as much opportunity for a woman.”"
    select @methodology.name, :from => "task_methodology_id"
    click_button "Create Task"

    expect(page).to have_content("There was a problem, please try again.")
    expect(page).to have_content("Focus is too long")
    expect(page).to have_content("Description is too long")
    expect(page).to have_content("Duration is not a number")
  end

  scenario 'user can view the details for a task' do
    task = FactoryGirl.create(:task)
    visit task_path(task)

    expect(page).to have_content(task.focus)
    expect(page).to have_content(task.duration)
    expect(page).to have_content(task.description)
  end

end
