require 'rails_helper'

RSpec.describe Methodology, model: true do
  it { should have_many(:tasks) }

  it { should validate_presence_of(:name) }

  it { should have_valid(:name).when('study', 'drill', 'do') }
  it { should_not have_valid(:name).when(nil, '', 'other') }

end
