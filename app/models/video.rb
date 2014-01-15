class Video < ActiveRecord::Base
  belongs_to :subsite
  belongs_to :year
  
  before_save :populate_other_fields
  
  def populate_other_fields
    
  end
end
