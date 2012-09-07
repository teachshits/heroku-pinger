class User < ActiveRecord::Base
  attr_accessible :email, :name, :provider, :uid, :number_of_sites
  
  def self.create_with_omniauth(auth)
    create! do |user|
      user.number_of_sites = 0
      user.set_not_admin
      user.provider = auth['provider']
      user.uid = auth['uid']
      if auth['info']
         user.name = auth['info']['name'] || ""
         user.email = auth['info']['email'] || ""
      end
    end
  end

 def set_not_admin
   logger.error "Calling set_not_admin"
   self.is_admin = false
   logger.error "leaving set_not_admin"
 end

=begin 
  def is_admin=(bool_arg)
    logger.error "calling is_admin="
    if bool_arg == true
      self.is_admin = true
    else
      self.is_admin = false
    end
    logger.error "Done with is_admin="
  end
=end
  validates :name, :presence => true
  validates :uid, :presence => true
  validates :number_of_sites, :presence => true

  has_many :websites

end
