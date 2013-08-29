class Applicationwebimage < ActiveRecord::Base
  belongs_to :application_id
  validates :application_id, :presence => true
  
  mount_uploader :imagefile, ApplicationimageUploader
end
