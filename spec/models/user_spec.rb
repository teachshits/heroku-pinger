require 'spec_helper'

describe User do

  before do
    @user = User.new(name: "Example User", email: "user@example.com",
                     provider: "twitter", uid: "1234")
  end

  subject { @user }

  it { should respond_to(:name) }
  it { should respond_to(:email) }
  it { should respond_to(:provider) }
  it { should respond_to(:uid) }

  describe "when name is not present" do
    before { @user.name = " " }
    it { should_not be_valid }
  end

  describe "when uid is not present" do
    before { @user.uid = " " }
    it { should_not be_valid }
  end

  

end
