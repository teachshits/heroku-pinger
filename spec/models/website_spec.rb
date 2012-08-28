require 'spec_helper'

describe Website do


  before :each do 
    @website = Website.new(
      minute: 1, user_id: 1, url: "http://www.yahoo.com",
      good_site: true
    )
  end

=begin
  before (:each) do
    @website = FactoryGirl.create(:website)
    @website.save
  end
=end

  let(:website) {
    Website.new(
      minute: 1, user_id: 1, url: "http://www.yahoo.com",
      name: "CNN"
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
    it { should respond_to(:good_site) }

  describe "fails with missing user id" do
    before { @website.user_id = nil }
    it { should_not be_valid }
  end

  describe "fails with missing minute" do
    before { @website.minute = nil }
    # why does this one not work?
    it { should_not be_valid }
  end

  describe "fails with missing url" do
    before { @website.url = nil }
    it { should_not be_valid }
  end

  describe "fails with missing name" do
    before { @website.name = nil }
    it { should_not be_valid }
  end

  describe "fails with missing good_site" do
    before { @website.good_site = nil }
    it { should_not be_valid }
  end

  describe "fails with invalid url" do
    before { @website.url = "www.google.com" }
    it { should_not be_valid }
  end

  describe "fails with invalid minute" do
    before { @website.minute = 7 }
    it { should_not be_valid }
  end


end
