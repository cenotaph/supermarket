class Year < ActiveRecord::Base
  has_many :applications
  def name
    year
  end
  
  def open?
    applications_open
  end
end
