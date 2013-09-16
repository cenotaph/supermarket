class Year < ActiveRecord::Base

  def name
    year
  end
  
  def open?
    applications_open
  end
end
