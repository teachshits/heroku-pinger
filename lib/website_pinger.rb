class WebsitePinger
  include Singleton
  require 'net/http'
  require 'uri'
  
  def do_stuff
    puts "this is WebsitePinger"
    array = Website.all
    puts "Num of websites: #{array.length}"
  end

  def ping_sites
    n = Time.new
    puts "Here is time: #{n}"
    c = Time.new
    time_s = c.to_s
    minute = time_s[14].to_i
    puts "about to call Websites.find_all_blah"

    websites = Website.find_all_by_minute(minute)
    puts "websites.size: #{websites.size}"
    websites.each do |site|
      puts "-----"
      puts "Here is the site name: #{site.name}"
      puts "Here is the site url: #{site.url}"
      puts "Here is the site minute: #{site.minute}"
      puts site.hello
      result = do_ping(site.url)
      
      # puts result
      puts "result.class: #{result.class}"
      puts "result.length: #{result.length}"  
    end

  end

  def do_ping(site_url)
    puts "calling do_ping with url #{site_url}"
    uri = URI(site_url)
    Net::HTTP.get(uri)
  end

end
