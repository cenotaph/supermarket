# encoding: utf-8

class AttachmentUploader < CarrierWave::Uploader::Base
  include CarrierWave::MiniMagick
  storage :fog  

  def store_dir
    "attachments/#{model.id}"
  end
  

end
