class Pressrelease < ActiveRecord::Base
  belongs_to :subsite
  belongs_to :year
  validates_presence_of :year_id, :subsite_id
  
  mount_uploader :attachment_eng, AttachmentUploader
  mount_uploader :attachment_swe, AttachmentUploader
  mount_uploader :image, ImageUploader
end
