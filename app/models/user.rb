class User < ActiveRecord::Base
  attr_accessible :email, :name, :provider, :uid, :number_of_sites
  
  def self.create_with_omniauth(auth)
    create! do |user|
      user.number_of_sites = 0
      user.provider = auth['provider']
      user.uid = auth['uid']
      if auth['info']
         user.name = auth['info']['name'] || ""
         user.email = auth['info']['email'] || ""
      end
    end
  end
  
  validates :name, :presence => true
  validates :uid, :presence => true
  validates :number_of_sites, :presence => true

  has_many :websites

end
