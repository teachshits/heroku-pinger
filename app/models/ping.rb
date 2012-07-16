class Ping < ActiveRecord::Base
  attr_accessible :response_length, :status, :website_id
  belongs_to :website
end
