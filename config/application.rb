# frozen_string_literal: true

require File.expand_path('boot', __dir__)

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(:default, Rails.env)

module Aim
  class Application < Rails::Application
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.
    config.autoload_paths += Dir["#{config.root}/lib/**/"]
    config.autoload_paths += %W[#{config.root}/app/models/ckeditor]

    config.secret_key_base = ENV['SECRETKEY']
    config.sass.load_paths += [
      "#{Gem.loaded_specs['foundation-rails'].full_gem_path}/vendor/assets/stylesheets/foundation/components",
      "#{Gem.loaded_specs['foundation-rails'].full_gem_path}/vendor/assets/stylesheets/foundation/"
    ]
    # Set Time.zone default to the specified zone and make Active Record auto-convert to this zone.
    # Run "rake -D time" for a list of tasks for finding time zone names. Default is UTC.
    # config.time_zone = 'Central Time (US & Canada)'
    # config.active_record.whitelist_attributes = true
    # The default locale is :en and all translations from config/locales/*.rb,yml are auto loaded.
    # config.i18n.load_path += Dir[Rails.root.join('my', 'locales', '*.{rb,yml}').to_s]
    # config.i18n.default_locale = :de
  end
end

I18n.enforce_available_locales = false
