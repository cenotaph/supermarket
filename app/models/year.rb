class Year < ActiveRecord::Base
  has_many :applications
  has_many :videos
  
  def name
    year
  end
  
  def open?
    applications_open
  end
end
