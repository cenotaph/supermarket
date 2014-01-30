class Applicationwebimage < ActiveRecord::Base
  belongs_to :application
  validates :application_id, :presence => true
 
  mount_uploader :imagefile, ApplicationimageUploader
  def caption
    title
  end
  
end
