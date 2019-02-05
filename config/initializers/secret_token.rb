# frozen_string_literal: true

# Be sure to restart your server when you modify this file.

# Your secret key is used for verifying the integrity of signed cookies.
# If you change this key, all old signed cookies will become invalid!

# Make sure the secret is at least 30 characters and all random,
# no regular words or you'll be exposed to dictionary attacks.
# You can use `rake secret` to generate a secure secret key.

# Make sure your secret_key_base is kept private
# if you're sharing your code publicly.

# if Rails.env.production? || Rails.env.staging?

CarrierWave.configure do |config|
  config.storage = :aws
  config.aws_bucket = 'aim-' + (Rails.env.development? ? 'development' : 'production')
  config.aws_acl    = :public_read
  config.aws_authenticated_url_expiration = 60 * 60 * 24 * 365

  config.aws_credentials = {
    access_key_id: ENV.fetch('AWS_ACCESS_KEY'),
    secret_access_key: ENV.fetch('AWS_SECRET_KEY'),
    region: 'eu-west-1'
  }
end
#
#
# CarrierWave.configure do |config|
#   config.fog_credentials = {
#     :provider               => 'AWS',       # required
#     :aws_access_key_id      => ENV['AWS_ACCESS_KEY'],       # required
#     :aws_secret_access_key  => ENV['AWS_SECRET_KEY'],       # required
#     :region                 => 'eu-west-1'  # optional, defaults to 'us-east-1'
#   }
#   config.fog_directory  = 'aim-' + Rails.env.to_s                     # required
#   # config.fog_attributes = {'Cache-Control'=>'max-age=315576000'}  # optional, defaults to {}
# end

if Rails.env.production? || Rails.env.staging?

  I18n.available_locales = [:en] # :'sv-SE']

  class Hash
    def flat_each(prefix = '', &blk)
      each do |k, v|
        if v.is_a?(Hash)
          v.flat_each(prefix + k + ': ', &blk)
        else
          yield prefix + k, v
        end
      end
    end
  end

  end
