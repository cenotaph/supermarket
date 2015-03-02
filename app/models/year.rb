class Year < ActiveRecord::Base
  has_many :applications
  has_many :videos
  has_and_belongs_to_many :funders
  
  def name
    year
  end
  
  def open?
    applications_open
  end
end
