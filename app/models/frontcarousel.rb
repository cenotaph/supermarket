class Frontcarousel < ActiveRecord::Base
  
  mount_uploader :image, BigcarouselUploader
  belongs_to :subsite
  
  validates_presence_of :subsite_id, :image
  
end
