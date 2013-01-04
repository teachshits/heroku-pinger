require "spec_helper"

include Capybara::DSL
include Capybara::RSpecMatchers

  class SessionProvider
    attr_reader :the_session
    def self.get_session
      the_session ||= create_session
    end

    private
    def self.create_session
=begin
      user = User.create(:name => "Joe",
                       :email => "alindeman@example.com",
                       :password => "ilovegrapes",
                       :password_confirmation => "ilovegrapes")

      visit "/users/sign_in"

      fill_in "Email", :with => "alindeman@example.com"
      fill_in "Password", :with => "ilovegrapes"
      click_button "Sign in"

      page.should have_content("Signed in successfully.")
=end
      #
      OmniAuth.config.test_mode = true
      OmniAuth.config.mock_auth[:twitter] = {
      'uid' => '12345',
      'provider' => 'twitter',
        'info' => {
        'name' => 'Bob'
        }
      }
      @user = FactoryGirl.create(:user)
      visit '/signin'


      return page
    end
  end
