# frozen_string_literal: true

class Background < ActiveRecord::Base
  mount_uploader :background_image, AttachmentUploader
  validates_presence_of :name

  scope :published, -> { where(published: true) }
end
