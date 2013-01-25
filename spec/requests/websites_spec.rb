require 'spec_helper'

# get method: part of get method: ActionDispatch::Integration::Runner
# response.class: ActionDispatch::TestResponse
# session in other tests is session is a: ActionController::TestSession
# puts "------ get method: #{self.method(:get).owner} "
# puts "------ response.class: #{response.class}"

describe "Websites" do

  let (:user) {
    FactoryGirl.create(:user2)
  }

  def valid_attributes
    { :user_id => user.id,
      :url => "http://valid-url-0000.herokuapp.com/users/1/edit"
    }
  end

  def valid_session
    {
      "user_id"=> user.id  
    }
  end

  def valid_session_from_user(user_id)
    {
      "user_id" => user_id
    }
  end

  describe "GET /websites" do
    it "works! (now write some real specs)" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      get websites_path
      response.status.should be(200)
    end

    it "should not contain link to make a new website" do
      visit "/websites"
      response.body.should have_content('Listing websites')
      response.body.should_not have_content('New Website') 
    end

    it "should contain link to stuff" do
      p = SessionProvider.get_session
      visit "/websites"
      response.body.should have_content('Listing websites')
      response.body.should have_content('New Website') 
    end

    it "creates a new website" do
      begin_count = Website.count
      p = SessionProvider.get_session
      visit "/websites/new"
      fill_in "Url", :with => "http://www.hello.com"
      fill_in "Name", :with => "Hello"
      fill_in "Summary", :with => "unknown"
      click_button "Create Website"
      puts "User.count: #{User.count}"
      response.body.should have_content('Website was successfully created.') 
      end_count = Website.count
      end_count.should == (begin_count + 1)
    end

    xit "only creates five websites" do
    end

  end
end


