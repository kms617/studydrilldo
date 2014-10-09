require 'rails_helper'

RSpec.describe Task, model: true do
  it { should belong_to(:goal) }
  it { should belong_to(:methodology) }

  it { should validate_presence_of(:goal) }
  it { should validate_presence_of(:methodology) }

  it { should have_valid(:completed).when(true, false) }
  it { should_not have_valid(:completed).when(nil, '') }

  it { should have_valid(:secret).when(true, false) }
  it { should_not have_valid(:secret).when(nil, '') }

  it { should have_valid(:focus).when('Recursion', 'Testing') }
  it { should_not have_valid(:focus).when(nil, '') }

  it { should have_valid(:duration).when(5, 10, 50) }
  it { should_not have_valid(:duration).when(nil, '', -10) }

  # it { should have_valid(:focus).when() }
  # it { should_not have_valid(:focus).when(nil, '') }

  # it { should have_valid(:description).when() }

  describe 'should validate presence of either action or action_url fields' do
    it 'is valid when action is present' do
      task = FactoryGirl.build(:task, action: 'something', action_url: nil)
      task.save
      expect(task.errors).to be_empty
    end

    it 'is valid when action_url is present' do
      task = FactoryGirl.build(:task, action: nil, action_url: 'http://www.launchacademy.com')
      task.save
      expect(task.errors).to be_empty
    end

    it 'has errors when action and action_url are nil' do
      task = FactoryGirl.build(:task, action: nil, action_url: nil)
      task.save
      expect(task.errors).to_not be_empty
    end

    it 'has errors when action and action_url are the empty string' do
      task = FactoryGirl.build(:task, action: '', action_url: '')
      task.save
      expect(task.errors).to_not be_empty
    end
  end

end
