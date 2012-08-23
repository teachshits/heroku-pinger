desc "This task is called by the Heroku scheduler add-on"
task :update_feed => :environment do
    puts "Updating feed..."
    # NewsFeed.update
    puts "done."
end

task :send_reminders => :environment do
    # User.send_reminders
    puts "This is task send reminders"
end

desc "This task will ping the sites"
task :ping_sites => :environment do
  require_relative '../website_pinger'
  require 'net/http'
  require 'uri'
  n = Time.new
  puts "Here is time: #{n}"
  c = Time.new
  time_s = c.to_s
  minute = time_s[14].to_i
  websites = Website.find_all_by_minute(minute)
  websites.each do |site|
    puts "-----"
    puts "Here is the site name: #{site.name}"
    puts "Here is the site url: #{site.url}"
    puts "Here is the site minute: #{site.minute}"
    puts site.hello
    uri = URI(site.url)
    result = Net::HTTP.get(uri)
    # puts result
    puts "result.class: #{result.class}"
    puts "result.length: #{result.length}"  
  end
  # WebsitePinger.do_Stuff
  wp = WebsitePinger.instance
  wp.do_stuff
end