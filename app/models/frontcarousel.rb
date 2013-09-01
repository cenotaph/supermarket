class Frontcarousel < ActiveRecord::Base
  
  mount_uploader :image, BigcarouselUploader
  belongs_to :subsite
  
  validates_presence_of :subsite_id
  
  scope :published, -> { where(published: true) }
  scope :by_subsite, ->(x) { where(subsite_id: x) }
  
end
