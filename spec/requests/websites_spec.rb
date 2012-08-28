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
      get websites_path
      puts "------ get method: #{self.method(:get).owner} "
      puts "------ response.class: #{response.class}"
      response.body.should have_content('Listing websites')
      response.body.should_not have_content('New Website') 
    end

    it "should contain link to stuff" do
      # not valid here for some reason
      # session[:user_id] = user.id
      puts "get is: #{self.}
      get websites_path, {}, valid_session_from_user(user.id)
      puts "------ get method: #{self.method(:get).owner} "
      puts "------ response.class: #{response.class}"
      response.body.should have_content('Listing websites')
      response.body.should_not have_content('New Website') 
      puts "response.body: #{response.body}"
    end

    xit "should contain a link to create a website when you are logged in" do

      # mock_omni_auth
      
=begin
      OmniAuth.config.mock_auth[:twitter] = {
        'uid' => '12345',
        'provider' => 'twitter',
        'info' => {
          'name' => 'Jimmy'
        }
      } 
=end
      # OmniAuth.config.add_mock(:twitter, {:uid => '12345'})

      get websites_path, {}, valid_session
      # puts "-----------------------------"
      puts "response.body: #{response.body}"
      puts "-----------------------------"
      puts "valid_attributes: #{valid_attributes.to_s}"
      puts "valid_session: #{valid_session.to_s}"
      
      response.body.should have_content('New Website') 
    end

  end
end


