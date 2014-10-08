require 'rails_helper'

RSpec.describe User, model: true do
  it { should have_valid(:email).when('fake@fake.com', 'foo@example.com') }
  it { should_not have_valid(:email).when('', nil, 'foo', 'foo@bar') }

  it { should have_valid(:username).when('fakey', 'foobar') }
  it { should_not have_valid(:username).when('', nil) }

  it 'has a matching password confirmation for the password' do
    user = User.new
    user.password = 'password'
    user.password_confirmation = 'otherpassword'

    expect(user).to_not be_valid
    expect(user.errors[:password_confirmation]).to_not be_blank
  end
end
