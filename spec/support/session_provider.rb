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
