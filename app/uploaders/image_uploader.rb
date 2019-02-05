# frozen_string_literal: true

class ImageUploader < CarrierWave::Uploader::Base
  include CarrierWave::MiniMagick
  storage :aws

  def default_url
    ActionController::Base.helpers.asset_path('' + [version_name, 'missing.png'].compact.join('_'))
  end

  def store_dir
    "images/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  version :sidebar do
    process resize_to_fit: [150, 150]
  end

  version :tiny do
    process resize_to_limit: [40, 40]
  end

  version :profile do
    process resize_to_fit: [300, 108]
  end

  version :slide do
    process resize_to_fill: [240, 240]
  end

  version :large do
    process resize_to_fit: [880, 660]
  end
end
