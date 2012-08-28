class WebsitePinger
  include Singleton
  require 'net/http'
  require 'uri'
  
  def ping_sites
    n = Time.new
    puts "Here is time: #{n}"
    c = Time.new
    time_s = c.to_s
    minute = time_s[14].to_i
    # puts "about to call Websites.find_all_blah with minute == #{minute}"

    websites = Website.where("minute = ? AND good_site = ?", minute, true)
    # puts "websites.size: #{websites.size}"
    websites.each do |site|
      if Rails.env.development?
        puts "-----"
        puts "Here is the site name: #{site.name}"
        puts "Here is the site url: #{site.url}"
        puts "Here is the site minute: #{site.minute}"
      end
      result = do_ping(site.url)
      
      # puts result
      if Rails.env.development?
        puts "result.class: #{result.class}"
        puts "result.length: #{result.length}"  
      end
      if result.length == 0
        site.failed_tries += 1
      else
        site.successful_tries += 1
      end
      if site.failed_tries == 5
        site.good_site = false
      end
      site.save
    end

  end

  def do_ping(site_url)
    puts "calling do_ping with url #{site_url}"
    uri = URI(site_url)
    Net::HTTP.get(uri)
  end

end
