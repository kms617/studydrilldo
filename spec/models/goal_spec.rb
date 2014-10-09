require 'rails_helper'

RSpec.describe Goal, model: true do
  it { should belong_to(:user) }
  it { should have_many(:tasks) }

  it { should validate_presence_of(:user) }
  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:duration) }

  it { should have_valid(:name).when('Learn Ruby', 'Perfect Freestyle') }
  it { should_not have_valid(:name).when(nil, '') }

  it { should have_valid(:secret).when(true, false) }
  it { should_not have_valid(:secret).when(nil, '') }

  it { should have_valid(:completed).when(true, false) }
  it { should_not have_valid(:completed).when(nil, '') }

  it { should have_valid(:duration).when(5, 10, 50) }
  it { should_not have_valid(:duration).when(nil, '', -10) }

end
