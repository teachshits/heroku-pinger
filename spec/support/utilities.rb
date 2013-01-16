include ApplicationHelper
=begin
def sign_in(user)
  # visit signin_path
  # fill_in "Email",    with: user.email
  # fill_in "Password", with: user.password
  # click_button "Sign in"
  # Sign in when not using Capybara as well.
  # cookies[:remember_token] = user.remember_token
  # session[:user_id] = user.id
  
  OmniAuth.config.test_mode = true
  OmniAuth.config.mock_auth[:twitter] = {
  'uid' => '12345',
  'provider' => 'twitter',
    'info' => {
      'name' => 'Jimmy'
    }
  }

end

def mock_omni_auth
  OmniAuth.config.test_mode = true
  OmniAuth.config.mock_auth[:twitter] = {
  'uid' => '12345',
  'provider' => 'twitter',
    'info' => {
      'name' => 'Jimmy'
    }
  }

  OmniAuth.config.add_mock(:twitter, {:uid => '12345'})

end
=end
