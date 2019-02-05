# frozen_string_literal: true

class Attachment < ActiveRecord::Base
  mount_uploader :image, AttachmentUploader
end
