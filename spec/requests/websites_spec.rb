require 'spec_helper'

# get method: part of get method: ActionDispatch::Integration::Runner
# response.class: ActionDispatch::TestResponse
# session in other tests is session is a: ActionController::TestSession

describe "Websites" do

# before do 
  # request.env["devise.mapping"] = Devise.mappings[:user] 
  # 
# end

  let (:user) {
    FactoryGirl.create(:user2)
  }
=begin
  before (:each) do
    # this works: 
    user = FactoryGirl.create(:user2)
    # this also works:
    # @user = User.new( :provider => "twitter", :uid => "12345", :name => "the user")
    user.save
    
  end
=end
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
      
      # get websites_path
      visit "/websites"
      # puts "------ get method: #{self.method(:get).owner} "
      # puts "------ response.class: #{response.class}"
      # puts "------ response.body: #{response.body}"
      response.body.should have_content('Listing websites')
      response.body.should_not have_content('New Website') 
    end

    it "should contain link to stuff" do
      # not valid here for some reason
      # session[:user_id] = user.id
      p = SessionProvider.get_session
      # puts "p is a #{p.class}"
      # puts "Inspecting the session: #{p.to_s}"
      # puts "Here is user.id: #{user.id}"
      visit "/websites"
      # get websites_path, {}, valid_session_from_user(user.id)
      # get websites_path, {}, valid_session #_from_user(user.id)
      # puts "------ get method: #{self.method(:get).owner} "
      # puts "------ response.class: #{response.class}"
      # puts "response.body: #{response.body}"
      response.body.should have_content('Listing websites')
      response.body.should have_content('New Website') 
    end

  end
end


