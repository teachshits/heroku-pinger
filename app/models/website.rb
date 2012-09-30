  require 'net/http'
  require 'uri'
class Website < ActiveRecord::Base



  VALID_VALUES = [0, 1, 2, 3, 4, 5]

  attr_accessible :failed_tries, :minute, :name, :successful_tries, :summary, :url, :user_id, :good_site

  before_validation :set_minute 
  validates :minute, :inclusion => { :in => VALID_VALUES,
    :message => "%{value} is not a valid value, must be one of 0, 1, 2, 3, 4 or 5" }, :presence => true
  
  validates :user_id, :presence => true
  validates :url, :presence => true
  validates :good_site, :presence => true
  validates :name, :presence => true
  validates_format_of :url, :with => /^(http):\/\/[a-z0-9]+([\-\.]{1}[a-z0-9]+)*\.[a-z]{2,5}(:[0-9]{1,5})?(\/.*)?$/ix

  belongs_to :user



  def self.ping_sites
    n = Time.new
    puts "Here is time: #{n}"
    c = Time.new
    time_s = c.to_s
    minute = time_s[14].to_i
    puts "about to call Websites.find_all_blah with minute == #{minute}"

    websites = Website.where("minute = ? AND good_site = ?", minute, true)
    puts "websites.size: #{websites.size}"
    websites.each do |site|
      if Rails.env.development? || Rails.end.test?
        puts "-----"
        puts "Here is the site name: #{site.name}, site url: #{site.url} site minute: #{site.minute} user id: #{site.user_id}"
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

  def self.do_ping(site_url)
    puts "calling do_ping with url #{site_url}"
    uri = URI(site_url)
    Net::HTTP.get(uri)
  end


protected
  def set_minute
    if self.minute.nil?
      self.minute = VALID_VALUES.sample
    end
  end


end
