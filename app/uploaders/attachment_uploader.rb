# frozen_string_literal: true

class AttachmentUploader < CarrierWave::Uploader::Base
  include CarrierWave::MiniMagick
  storage :aws

  def store_dir
    "attachments/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end
end
