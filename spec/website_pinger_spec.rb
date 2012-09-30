require 'spec_helper'
# no help
require 'active_record'
# no help
require_relative '../app/models/website'



describe WebsitePinger do

  before (:each) do
    @wp = WebsitePinger.instance
    # @wp = WebsitePinger.new
  end
  # let(:wp) { WebsitePinger.instance }
=begin
  it "does stuff" do
    puts "This is does stuff"
  end
=end
  it "tests ping_sites method" do
    @wp.ping_sites
  end

=begin
  it "tests do_ping method" do
    x = wp.do_ping("http://www.yahoo.com")
  end
=end
end
