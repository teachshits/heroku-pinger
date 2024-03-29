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

protected
  def set_minute
    self.minute = VALID_VALUES.sample
  end


end
