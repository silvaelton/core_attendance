require_relative 'boot'

require 'rails/all'

Bundler.require(*Rails.groups)
require "core_attendance"

rails_root = Pathname.new('..').expand_path(File.dirname(__FILE__))

begin
  APP_ENV = YAML.load_file("#{rails_root}/config/env.yml")
rescue
  if Rails.env.development? || Rails.env.test?
    raise ArgumentError, 'Need to configure config/env.yml'
  end
end

module TestApp
  class Application < Rails::Application
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.
  end
end

