require 'spec_helper'

describe "Websites" do
  before(:each) do 
    # request.env["devise.mapping"] = Devise.mappings[:user] 
    request.env["omniauth.auth"] = OmniAuth.config.mock_auth[:twitter] 
  end

   it "tries to make a new book without being signed in" do
    OmniAuth.config.test_mode = true
    cc  = OmniAuth.config.add_mock(:twitter, {:uid => '12345'})
    puts "cc.class: #{cc.class}"
    puts "cc.keys: "
    cc.keys.each do |k|
      puts "key: #{k} value: #{cc[k]}"
    end
    visit "/websites"
    page.should have_content("New Website")
    puts "--"
    puts "page.html: #{page.html}"
    
    puts "My method seemed to work"
  end


   it "has a cello" do

    OmniAuth.config.test_mode = true
          OmniAuth.config.test_mode = true
      OmniAuth.config.mock_auth[:twitter] = {
        'uid' => '12345',
        'provider' => 'twitter',
        # 'info' => {
          'name' => 'Jimmy'
        # }
      } 
=begin    
    cc  = OmniAuth.config.add_mock(:twitter, {:uid => '12345'})
    puts "cc.class: #{cc.class}"
    puts "cc.keys: "
    cc.keys.each do |k|
      puts "key: #{k} value: #{cc[k]}"
    end
=end    
    visit "/websites"
    page.should have_content("New Website")
    puts "--"
    puts "page.html: #{page.html}"
    
    puts "My method seemed to work"
  end
end
