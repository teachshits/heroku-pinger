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

  # WebsitePinger.do_Stuff
  wp = WebsitePinger.instance
  wp.do_stuff
  wp.ping_sites
end