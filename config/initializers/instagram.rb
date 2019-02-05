# frozen_string_literal: true

InstagramApi.config do |config|
  config.access_token = ENV['instagram_api']
  config.client_id = ENV['insta_client']
  config.client_secret = ENV['insta_secret']
end
