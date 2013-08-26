class Attachment < ActiveRecord::Base
  mount_uploader :image, AttachmentUploader
end