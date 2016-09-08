require File.expand_path('../boot', __FILE__)
require 'rails/all'
Bundler.require(*Rails.groups)

module MicroservicesNtdsurveys
  class Application < Rails::Application
    config.encoding = 'utf-8'
    config.time_zone = 'Eastern Time (US & Canada)'
    config.autoload_paths << Rails.root.join('lib')
    config.filter_parameters += [:password, :secret, :spire, :github]
  end
end
