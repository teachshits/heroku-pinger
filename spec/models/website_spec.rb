require 'spec_helper'

describe Website do

=begin
  before :each do 
    @website = Website.new(
      minute: 1, user_id: 1, url: "http://www.yahoo.com"
    )
  end
=end
  before (:each) do
    # this works:
    @website = FactoryGirl.create(:website)
    # this also works:
    # @user = User.new( :provider => "twitter", :uid => "12345", :name => "the user")
    @website.save
  end
  let(:website) {
    Website.new(
      minute: 1, user_id: 1, url: "http://www.yahoo.com"
    )
  }

  subject { @website }

  it { should respond_to(:failed_tries) }
  it { should respond_to(:minute) }
  it { should respond_to(:name) }
  it { should respond_to(:successful_tries) }
  it { should respond_to(:summary) }
  it { should respond_to(:url) }
  it { should respond_to(:user_id) }

  describe "fails with missing user id" do
    before { @website.user_id = nil }
    it { should_not be_valid }
  end

  describe "fails with missing minute" do
    before { @website.minute = nil }
    # it { should_not be_valid }
  end

  describe "fails with missing url" do
    before { @website.url = nil }
    it { should_not be_valid }
  end


end
