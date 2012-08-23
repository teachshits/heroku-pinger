class WebsitePinger
  include Singleton

  def do_stuff
    puts "this is WebsitePinger"
    array = Website.all
    puts "Num of websites: #{array.length}"
  end

end
