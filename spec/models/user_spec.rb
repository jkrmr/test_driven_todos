require 'rails_helper'

describe User, type: :model do
  it { should validate_presence_of(:email) }
  it { should validate_uniqueness_of(:email) }
  it { should have_many(:todos) }

  it 'validates the format of :email' do
    user = build(:user)

    user.email = 'email at example dot com'

    expect(user).to_not be_valid
  end
end
